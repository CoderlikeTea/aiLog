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
LOGSTASH_APP_HOME="${BASE_HOME}/app/logstatsh2"

export  JAVA_HOME
export  LOGSTASH_HOME

${LOGSTASH_HOME}/bin/logstash -f  $1



