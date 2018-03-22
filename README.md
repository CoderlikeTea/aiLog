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
  进入bin目录 执行start_personal_log.sh脚本 
 #### 脚本简介<br>
- sh start_personal_log.sh(服务端启动脚本)
- sh stop_personal_log.sh(停止脚本)
- sh  restart_personal_log.sh(服务端重启脚本)

<br>






 






