#!/bin/ksh

# ����:����
# ����:zhangtao3@asiainfo.com
# ����ʱ��:2018-03-13
# �ű�Ŀ��:[�޸���ע��Ŀ��]
# �޸�ԭ��:[�޸���ע��ԭ��]
# �޸�ʱ��:[�޸���ע��ʱ��]
# �޸�����:[�޸���ע������]

BASE_HOME="/app/log"
LOGSTASH_HOME="${BASE_HOME}/software/logstash/logstash-2.4.1"
JAVA_HOME="${BASE_HOME}/software/vm/jdk1.8.0_91"
LOGSTASH_APP_HOME="${BASE_HOME}/app/logstash2"

export  JAVA_HOME
export  LOGSTASH_HOME

echo "Listening Port:$1"
echo "$2 center log"
${LOGSTASH_HOME}/bin/logstash -e 'input { log4j { port => '$1' tags => ["'$2'"] } }'  -f ${LOGSTASH_APP_HOME}/config/logstash2.conf

echo "$2 center log start"


