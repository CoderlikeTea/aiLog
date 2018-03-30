#!/bin/ksh

# 作者:章涛
# 邮箱:zhangtao3@asiainfo.com
# 创建时间:2018-3-13
# 脚本目的:监控java进程状态
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]

VARS=$#
if [ $VARS -lt 2 ];
then
        echo "必须传入2个参数,第一个参数是进程名称,第二个参数是进程参数"
        exit 0;
fi


PROCESS_NAME=$1
PROCESS_PARM=$2
PROCESS_COUNT=0

ps -ef |grep $PROCESS_NAME | grep $PROCESS_PARM | grep java | grep -v grep | awk '{print $2}' |while read pid
do
        PROCESS_COUNT=`expr $PROCESS_COUNT + 1`
done


if [ $PROCESS_COUNT -gt 0 ];
then
        echo "PROCESS_EXIST"
else
                                echo "$1 $2 PROCESS_NOT_EXIST"
fi
