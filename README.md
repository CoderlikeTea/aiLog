# aiLog操作手册

## 客户端配置
 * 项目部署AILog-1.0-SNAPSHOT.jar<br>
 * 配置log4j.properties
    在项目的log4j.properties文件中添加以下配置
 ```
 log4j.rootLogger=debug,server
 ```
 ```
log4j.appender.server=com.ai.omframe.util.AISocketAppender
log4j.appender.server.Port=4719
log4j.appender.server.RemoteHost=20.26.26.27
log4j.appender.server.ReconnectionDelay=10000
log4j.appender.server.application=yuqh3_exe
log4j.appender.server.ExtendPara=com.ai.omframe.util.ExtendPara
```
<br>
* 自定义配置

## 服务端配置


