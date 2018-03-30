#!/bin/ksh

# 作者:章涛
# 邮箱:zhangtao3@asiainfo.com
# 创建时间:2018-03-13
# 脚本目的:[修改请注明目的]
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]

PROCESS_NAME="logstash"
PROCESS_PARM="personal-center"


CUR_USER=`whoami`
ps -ef|grep $PROCESS_NAME |grep ${CUR_USER} | grep $PROCESS_PARM | grep java | grep -v grep | awk '{print $2}' |while read pid
do
        kill ${pid} 2>&1 >/dev/null
        echo "进程名称:${PROCESS_NAME},参数:${PROCESS_PARM},PID:${pid} 成功停止"
done
