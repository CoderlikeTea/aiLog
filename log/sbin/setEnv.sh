#!/bin/sh

# Ŀ��:����ͨ�û�������

# ����:�벻Ҫ�����޸�
# ����:����
# �ʼ�:zhangtao3@asiainfo.com
# ����ʱ��:2018-03-07
# �ű�Ŀ��:��������java����
# �޸�ԭ��:[�޸���ע��ԭ��]
# �޸�ʱ��:[�޸���ע��ʱ��]
# �޸�����:[�޸���ע������]

# *************************************************************************
# JAVA_OPTIONS - java����ѡ��
# JAVA_VM      - jvmѡ��
# MEM_ARGS     - �ڴ����
# *************************************************************************
#echo "*************************************************"

#echo "��ʼ��ͨ�û�������"

JAVA_HOME="$HOME/java"
#echo "JAVA_HOME=${JAVA_HOME}"

APP_HOME="$HOME"
#echo "APP_HOME=${APP_HOME}"

COMMON_LIB_HOME="${APP_HOME}/lib"
export COMMON_LIB_HOME
#echo "COMMON_LIB_HOME=${COMMON_LIB_HOME}"

COMMON_LIBEXT_HOME="${APP_HOME}/libext"
export COMMON_LIBEXT_HOME
#echo "COMMON_LIBEXT_HOME=${COMMON_LIBEXT_HOME}"

COMMON_CONFIG_HOME="${APP_HOME}/config"
#echo "COMMON_CONFIG_HOME=${COMMON_CONFIG_HOME}"

COMMON_CONFIGEXT_HOME="${APP_HOME}/configext"
#echo "COMMON_CONFIGEXT_HOME=${COMMON_CONFIGEXT_HOME}"

#UNIX����������libĿ¼�µ�ÿһ��jar�ļ���windows�������޸�
CP=
for file in ${COMMON_LIBEXT_HOME}/*;
do CP=${CP}:$file;
done

for file in ${COMMON_LIB_HOME}/*;
do CP=${CP}:$file;
done

#����libĿ¼��jar�ļ����


CLASSPATH="${COMMON_CONFIGEXT_HOME}:${COMMON_CONFIG_HOME}:${CP}"
export CLASSPATH


JAVA_OPTIONS=" -Dfile.encoding=GBK  -Doracle.jdbc.V8Compatible=true  -Dweblogic.ThreadPoolSize=20 -Dweblogic.ThreadPoolPercentSocketReaders=80  "

MEM_ARGS="-Xms128m -Xmx128m"

#echo "��ʼ��ͨ�û����������"

echo $CLASSPATH