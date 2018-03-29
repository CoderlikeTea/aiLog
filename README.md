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
log4j.appender.server=com.ai.appender.AISocketAppender
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

### 服务端部署
 * 解压github上下载的 ailog-service-app.zip
 * 将解压后的 ailog-service-app 上传至目标主机上
 
 * 执行 ailog-service-app 下的 ailog_initialize.sh 脚本 
   后面追加启动参数(用户名)
 ```
 sh  ailog_initialize.sh {用户名}
 ```
 
 * 使用新加的用户名登陆目标主机(默认密码 123456)
 
 * 修改bin目录下的 start_{用户名}_log.sh 中的启动参数(端口号，中心名称)<br>
  将 4719 修改成本中心的端口  将 personal-center 修改成本中心的名称
 ```
 ${LOGSTASH_APP_HOME}/bin/start_logstash2.sh 4719 personal-center
 ```
   1-- 端口号须保证与客户端的配置的端口号保持一致<br>
   2-- 端口号不可与其他中心的端口号一致
 
 
  #### 脚本简介<br>
-  start_personal_log.sh(服务端启动脚本)
-  stop_personal_log.sh(停止脚本)
-  restart_personal_log.sh(服务端重启脚本)
 
### 结果展示
 
在完成客户端,服务端的配置后<br>
执行本中心的 start_personal_log.sh 脚本 <br>

就可以在本中心的logs目录下看到日志文件了














 






