#!/bin/sh

# 作者:俞琪辉
# 邮箱:yuqh3@asiainfo.com
# 创建时间:2018-03-13
# 脚本目的:[修改请注明目的]
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]


USER_COUNT=`cat /etc/passwd | grep '^'$1':' -c`
LOG_USER_COUNT=`cat /etc/passwd | grep '^log:' -c`

if [ $LOG_USER_COUNT -ne 1 ]
 then
 useradd  -d /app/log -m log
 echo "log2018" | passwd log --stdin
cp -arf log/app ../log/
cp -arf log/sbin ../log/
cp -arf log/software ../log/
 else
 echo ' log is exits '
fi

if [ $USER_COUNT -ne 1 ]
 then
 useradd  -d /app/$1 -m $1
 echo $2 | passwd $1 --stdin
 rm -r ../$1/bin
 cp -arf personal/bin/ ../$1/
 mkdir ../$1/logs

rename 'personal' $1 ../$1/bin/*.sh
sed -i "s/personal-center/$3/g" `grep personal-center -rl ../$1/bin/*.sh`
sed -i "s/personal/$1/g" `grep personal -rl ../$1/bin/*.sh`
sed -i "s/4719/$4/g" `grep 4719 -rl ../$1/bin/*.sh`
chmod +x ../$1/bin/*.sh
 else
 echo ' '$1' is exits '
fi
