# AILog操作手册

## 背景
测试人员在获取日志文件之前都要去确认当前实例处于哪台主机上才能获取到日志<br>
为提高工作效率,测试人员提出希望在同一台主机上获取日志

## 客户端配置
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
log4j.appender.server.ExtendPara=com.ai.extpara.ExtendPara
```
```
#配置输出的地方（这个名字必须与新增的Appender名称一致）
 log4j.rootLogger=debug,server
```


 * 自定义配置 <br>
满足参数可扩展，中心可自定义参数并将其传到服务端
客户端可以自定义属性扩充类
1-实现com.ai.extpara.interfaces.IExtendParaSV接口，添加get{Field}方法
例：
 
 ```
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



* ADCloud编译发布

## 服务端(以个人订单为例)
 * 登陆`20.26.27.27`(personal/123456)<br>
  cd bin
 * 脚本简介

 






