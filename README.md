# AILog快速使用手册

## 背景
<br>
为提高工作效率,测试人员提出希望在同一台主机上获取日志

### 客户端配置
 1 项目部署AILog-1.0-SNAPSHOT.jar<br>
 2 配置log4j.properties<br>
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
3 编译发布

### 服务端部署
 1 在github获取aiLog.zip
 2 将aiLog.zip上传至目标主机上app目录下
  使用
 ```
 xz aiLog.zip
 ```
 
 3 执行 aiLog 下的 ailog_init.sh 脚本 (服务端初始化脚本)
 sh  ailog_initialize.sh [username] [passwd] [center-code] [port]
 [username]   设置用户名 
 [passwd]     设置密码
 [center-code] 设置服务端所属中心--在同一台主机上保证中心名称唯一
 [port]  服务启动端口号--在同一台主机上保证端口号唯一
 
 例：
   
 ```
 sh  ailog_initialize.sh personal 123456 personal-center 4719
 新建一个用户（personal） 密码为：123456 服务端所属中心：个人订单  服务端端口号：4719
 
 ```
 
 4 使用新加的用户名登陆目标主机
 

 
 
  #### 脚本简介<br>
-  start_personal_log.sh(服务端启动脚本)
-  stop_personal_log.sh(停止脚本)
-  restart_personal_log.sh(服务端重启脚本)
 
### 结果展示
 
在完成客户端,服务端的配置后<br>
执行本中心的 start_{用户名}_log.sh 脚本 <br>

就可以在本中心的logs目录下看到日志文件了














 






