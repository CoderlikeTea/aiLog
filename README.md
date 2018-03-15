# aiLog操作手册

## 客户端配置
 * 项目部署AILog-1.0-SNAPSHOT.jar
 * 配置log4j.properties
 ```
log4j.appender.server=com.ai.omframe.util.AISocketAppender
log4j.appender.server.Port=4719
log4j.appender.server.RemoteHost=20.26.26.27
log4j.appender.server.ReconnectionDelay=10000
log4j.appender.server.application=yuqh3_exe
log4j.appender.server.ExtendPara=com.ai.omframe.util.ExtendPara
```
* 自定义属性
为满足服务端div需求
## 服务端配置


