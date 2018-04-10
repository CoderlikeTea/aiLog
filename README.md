# AILog快速使用手册

## 背景
<br>
为提高工作效率,测试人员提出希望在同一台主机上获取日志

### 前期准备
1- 获取aiLog-master.zip

<img src="https://github.com/CoderlikeTea/aiLog/blob/master/other/downzip.png" width=640 height=256 />

2- 本地解压aiLog-master.zip


  

### 客户端配置
 1- 获取other目录下的ailog-1.0.jar
 
 2- 项目部署ailog-1.0.jar<br>
 
 3- 配置log4j.properties<br>
   在项目的log4j.properties文件中添加以下配置
 ```
##server
##使用soctet连接发送日志信息
log4j.appender.server=com.ai.appender.ReformSocketAppender
##服务端对应的端口（原则上 中心与端口一一映射）
log4j.appender.server.Port=4719
##服务端主机IP
log4j.appender.server.RemoteHost=20.26.26.27
log4j.appender.server.ReconnectionDelay=10000
##配置中心应用名
log4j.appender.server.application=personal-csf
##属性扩展类
log4j.appender.server.ExtendPara=com.ai.extpara.impl.AppFrameExtendPara
```
```
#配置输出的地方（这个名字必须与新增的Appender名称一致）
 log4j.rootLogger=debug,server
```
4- 编译发布

### 服务端部署
 
 
1- 将aiLog-master.zip上传至目标主机<br>

2-执行以下脚本,解压aiLog-master.zip

```
 unzip aiLog-master.zip
 ```
 
2- 使用root用户执行 aiLog-master 下的 init.sh 脚本 (服务端初始化脚本)
 
 ```
 sh  init.sh
 ```
 
3- 使用新增的用户登陆目标主机
 

 
#### 脚本简介(bin目录下)<br>
  
-  start_personal_log.sh(服务端启动脚本)
-  stop_personal_log.sh(停止脚本)
-  restart_personal_log.sh(服务端重启脚本)
 
### 日志展示
 
在完成客户端,服务端的配置后<br>
执行本中心的 start_{用户名}_log.sh 脚本 <br>

就可以在logs目录下看到日志文件了














 






