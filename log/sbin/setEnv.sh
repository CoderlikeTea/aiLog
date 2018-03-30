#!/bin/sh

# 目的:设置通用环境变量

# 警告:请不要随意修改
# 作者:章涛
# 邮件:zhangtao3@asiainfo.com
# 创建时间:2018-03-07
# 脚本目的:启动独立java进程
# 修改原因:[修改请注明原因]
# 修改时间:[修改请注明时间]
# 修改作者:[修改请注明作者]

# *************************************************************************
# JAVA_OPTIONS - java启动选项
# JAVA_VM      - jvm选项
# MEM_ARGS     - 内存参数
# *************************************************************************
#echo "*************************************************"

#echo "初始化通用环境参数"

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

#UNIX环境连接主lib目录下的每一个jar文件，windows环境请修改
CP=
for file in ${COMMON_LIBEXT_HOME}/*;
do CP=${CP}:$file;
done

for file in ${COMMON_LIB_HOME}/*;
do CP=${CP}:$file;
done

#连接lib目录下jar文件完成


CLASSPATH="${COMMON_CONFIGEXT_HOME}:${COMMON_CONFIG_HOME}:${CP}"
export CLASSPATH


JAVA_OPTIONS=" -Dfile.encoding=GBK  -Doracle.jdbc.V8Compatible=true  -Dweblogic.ThreadPoolSize=20 -Dweblogic.ThreadPoolPercentSocketReaders=80  "

MEM_ARGS="-Xms128m -Xmx128m"

#echo "初始化通用环境参数完成"

echo $CLASSPATH