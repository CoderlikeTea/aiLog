#!/bin/sh

# 作者:俞琪辉
# 邮箱:yuqh3@asiainfo.com
# 创建时间:2018-03-13
# 脚本目的:[修改请注明目的]
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]
LOG_USER_COUNT=`cat /etc/passwd | grep '^log:' -c`


if [ $LOG_USER_COUNT -ne 1 ]
 then
 useradd  -d /app/log  -m log 
 echo "log2018" | passwd log --stdin
 cp -arf log/app      /app/log
 cp -arf log/sbin     /app/log
 cp -arf log/software /app/log
 chmod -R 750 /app/log
 chown log  -R /app/log
 chgrp log /app/log
 echo ' log用户已初始化成功'
else
 echo ' log is exits '
fi

echo -n "请输入用户名:" ---:
read username;

USER_COUNT=`cat /etc/passwd | grep '^'$username':' -c`


if [ $USER_COUNT -ne 1 ]
 then
 useradd  -d /app/$username  -m $username -g log
 echo -n "请输入密码:" ---:
 read pwd
 echo $pwd | passwd $username --stdin
 cp -arf personal/bin /app/$username/
 mkdir ../../app/$username/logs

 rename 'personal' $username /app/$username/bin/*.sh
 echo -n "请输入应用名称:" ---:
 read app;
 sed -i "s/personal-center/$app/g" `grep personal-center -rl /app/$username/bin/*.sh`
 sed -i "s/personal/$username/g" `grep personal -rl /app/$username/bin/*.sh`
 echo -n "请输入启动端口:" ---:
 read port;
 sed -i "s/4719/$port/g" `grep 4719 -rl /app/$username/bin/*.sh`
 chown $username -R /app/$username/
 chgrp log  /app/$username/
 chmod 700 /app/$username/bin/*.sh
 echo ' '$username'用户已初始化成功 '
else
 echo ' '$username' 用户已存在 '
fi
