#!/bin/ksh


# 作者:章涛
# 邮箱:zhangtao3@asiainfo.com
# 创建时间:2018-03-13
# 脚本目的:[修改请注明目的]
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]


#判断进程是否重复启动
./monitor_personal_log.sh | read PROCESS_ALIVE_STATUS
if [ "$PROCESS_ALIVE_STATUS" = "PROCESS_EXIST" ];
then
        echo "此进程已经启动了,不能重复启动"
        exit 0;
fi
#判断进程是否重复启动结束


BASE_HOME="/app/log"
LOGSTASH_APP_HOME=${BASE_HOME}/app/logstash2/
${LOGSTASH_APP_HOME}/bin/start_logstash2.sh 4719 personal-center
