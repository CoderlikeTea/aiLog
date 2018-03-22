# AILog快速使用手册

## 背景
<br>
为提高工作效率,测试人员提出希望在同一台主机上获取日志

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
* 编译发布

### 服务端(以个人订单为例)
 * 登陆`20.26.27.27`(personal/123456)<br>
 * 在/app目录下创建本中心的目录(目录以中心的名称命名)
 
  
 * 复制/app/persoanl/bin目录到新建的本中心目录下
 
 * 在新建的本中心目录下新建logs目录（用以存放本中心日志）
 
 * 修改start_personal_log.sh中的启动参数(端口号，中心名称)<br>
 
    <font color=#0099ff size=12 face="黑体">注</font> 端口号须保证与客户端的配置的端口号保持一致<br>
    <font color=#0099ff size=12 face="黑体">注</font> 端口号尽量与别的中心的端口号不一样

 
 #### 脚本简介<br>
-  start_personal_log.sh(服务端启动脚本)
-  stop_personal_log.sh(停止脚本)
-  restart_personal_log.sh(服务端重启脚本)

<br>

### 结果展示
在完成客户端与服务端的配置后<br>

启动： start_personal_log.sh 之后

会在logs目录下看到本中心的日志










 






