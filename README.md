# aiLog操作手册

## 背景
测试人员在获取日志文件之前都要去马拉松上看一下当前处于哪台主机上才能获取到日志<br>
为提高工作效率,测试人员提出希望在同一台主机上获取日志

## 客户端配置
 * 项目部署AILog-1.0-SNAPSHOT.jar<br>
 * 配置log4j.properties<br>
   在项目的log4j.properties文件中添加以下配置
 ```
 ##使用soctet连接发送日志信息
log4j.appender.server=com.ai.omframe.util.AISocketAppender
##服务端对应的端口
log4j.appender.server.Port=4719
##服务端主机IP
log4j.appender.server.RemoteHost=20.26.26.27
log4j.appender.server.ReconnectionDelay=10000
##中心名
log4j.appender.server.application=personal_exe
##属性扩展类
log4j.appender.server.ExtendPara=com.ai.omframe.util.ExtendPara
```
```
#
 log4j.rootLogger=debug,server
```
<br>
* 自定义配置 <br>
满足参数可扩展，个中心可自定义参数传到服务端

## 服务端
*登陆`20.26.27.27`(personal/123456)

*启动




