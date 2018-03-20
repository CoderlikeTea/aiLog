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
### 客户端改造
* 实现类改造
1. 实现com.ai.extpara.interfaces.IExtendParaSV接口，添加get{Field}方法
例：
 
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
2. 继承com.ai.extpara.impl.AppFrameExtendPara
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
log4j.appender.server.ExtendPara=<font color=#00ffff >com.ai.omframe.util.DemoExtendParaSVImpl</font>
```
```
#配置输出的地方（这个名字必须与新增的Appender名称一致）
 log4j.rootLogger=debug,server
```



### 服务端改造
服务端修改对应本项目的logstash.conf
```
修改完后执行服务端重启脚本




 






