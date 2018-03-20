# AILog操作手册

## 背景
<br>
为提高工作效率,测试人员提出希望在同一台主机上获取日志

## AILog的基本使用方法
### 客户端配置
 * 项目部署AILog-1.0-SNAPSHOT.jar<br>
 * 配置log4j.properties<br>
   在项目的log4j.properties文件中添加以下配置
 ```
 ##使用soctet连接发送日志信息
log4j.appender.server=com.ai.aiappender.AISocketAppender
##服务端对应的端口（原则上 中心与端口一一映射）
log4j.appender.server.Port=4719
##服务端主机IP
log4j.appender.server.RemoteHost=20.26.26.27
log4j.appender.server.ReconnectionDelay=10000
##配置中心应用名
log4j.appender.server.application=personal-csf
##属性扩展类
log4j.appender.server.ExtendPara=com.ai.extpara.AppFrameExtendPara
```
```
#配置输出的地方（这个名字必须与新增的Appender名称一致）
 log4j.rootLogger=debug,server
```
* ADCloud编译发布

### 服务端(以个人订单为例)
 * 登陆`20.26.27.27`(personal/123456)<br>
  进入bin目录 执行start_personal_log.sh脚本 
 #### 脚本简介<br>
- sh start_personal_log.sh(服务端启动脚本)
- sh stop_personal_log.sh(停止脚本)
- sh  restart_personal_log.sh(服务端重启脚本)

<br>


## 自定义本中心属性
### 客户端改造(支持两种改造方式)
其中重构法适用于不基于AppFrame的项目，追加法适用于基于AppFrame的项目。
* 实现类改造
1. 重构法 <br>
实现com.ai.extpara.interfaces.IExtendParaSV接口，添加get{Field}方法
 
```
package com.ai.omframe.util;
public class DemoExtendParaSVImpl implements IExtendParaSV {
    public String  author;
    
    /**
      get方法命名格式严格按照get+filed的格式命名
      且在方法中需将filed的首字母变成大写
    */
    public String getAnother(){
        return this.author = "coder";
    }
}
```
2. 追加法<br>
 继承com.ai.extpara.impl.AppFrameExtendPara 添加get{Field}方法
```
package com.ai.omframe.util;

public class DemoExtendPara extends  AppFrameExtendPara {
    public String another;

    /**
      get方法命名格式严格按照get+filed的格式命名
      且在方法中需将filed的首字母变成大写
     */
    public String getAnother(){
        return  this.another = "coder";
    }

}
```
* 配置自定义log4j.properties
修改log4j.appender.server.ExtendPara标签的value

 ```
 ##使用soctet连接发送日志信息
log4j.appender.server=com.ai.aiappender.AISocketAppender
##服务端对应的端口（原则上 中心与端口一一映射）
log4j.appender.server.Port=4719
##服务端主机IP
log4j.appender.server.RemoteHost=20.26.26.27
log4j.appender.server.ReconnectionDelay=10000
##配置中心应用名
log4j.appender.server.application=personal-csf
##属性扩展类
log4j.appender.server.ExtendPara=com.ai.omframe.util.DemoExtendParaSVImpl
```


```
#配置输出的地方（这个名字必须与新增的Appender名称一致）
 log4j.rootLogger=debug,server
```



### 服务端改造
根据客户端选择的改造方案的不同，服务端也有不同的修改方案
找到本项目对应的logstath.conf

```
filter {
        mutate{
                split => ["host",":"]
                add_field => {
                        "ip" => "%{[host][0]}"
                }

                add_field => {
                        "prot" => "%{[host][1]"
                }

                remove_field => ["host"]

                add_field => {
                        "stack_trace" =>"%{stack_trace} "
                }


        }

        date {
                match => ["timestamp","UNIX_MS"]
                target => "timestamp"
        }

        ruby {
                code => "event['timestamp'] = LogStash::Timestamp.new(event['timestamp']+ 8*60*60)"
        }
}
output {
  if [stack_trace] != "%{stack_trace} " {
       file {
         path => "~/logs/%{application}-%{+YYYYMMdd}-%{processName}-%{ip}.log"
         codec => plain {
             format => "[%{timestamp}] [%{thread}] (%{opCode}:%{opId}) (%{file}) %{priority} %{class} - %{message}
%{stack_trace}
"
             }
         }
   }else{
      file {
        path => "~/logs/%{application}-%{+YYYYMMdd}-%{processName}-%{ip}.log"
        codec => plain {
            format => "[%{timestamp}] [%{thread}] (%{opCode}:%{opId}) (%{file}) %{priority} %{class} - %{message}
"
            }
        }
    }

}
```
重构法对应服务端改造：
删除output.file.path 和 output.file.codec.plain.format对应的value值
 添加自定应配置
 以前面客户端改造使用的最加法为例：
 我要在日志打印出作者信息
 可以把对应的output改成即可
 ```
 output {
  if [stack_trace] != "%{stack_trace} " {
       file {
         path => "~/logs/%{application}-%{+YYYYMMdd}-%{ip}.log"
         codec => plain {
             format => "[%{timestamp}] [%{thread}] (%{another}) (%{file}) %{priority} %{class} - %{message}
%{stack_trace}
"
             }
         }
   }else{
      file {
        path => "~/logs/%{application}-%{+YYYYMMdd}-%{ip}.log"
        codec => plain {
            format => "[%{timestamp}] [%{thread}] (%{another}) (%{file}) %{priority} %{class} - %{message}
"
            }
        }
    }

}
 ```
 
 使用追加法对应的服务端的改造
 直接在原有的基础上添加就可以了
 比如我要使用追加法在日志中显示作者信息，把outPut修改成
 ```
 output {
  if [stack_trace] != "%{stack_trace} " {
       file {
         path => "~/logs/%{application}-%{+YYYYMMdd}-%{processName}-%{ip}.log"
         codec => plain {
             format => "[%{timestamp}] [%{thread}] (%{opCode}:%{opId}) (%{another}) (%{file}) %{priority} %{class} - %{message}
%{stack_trace}
"
             }
         }
   }else{
      file {
        path => "~/logs/%{application}-%{+YYYYMMdd}-%{processName}-%{ip}.log"
        codec => plain {
            format => "[%{timestamp}] [%{thread}] (%{opCode}:%{opId}) (%{another}) (%{file}) %{priority} %{class} - %{message}
"
            }
        }
    }

}
 ```
 

最后我们重启一下服务，让配置生效。





 






