#!/bin/ksh

# ����:����
# ����:zhangtao3@asiainfo.com
# ����ʱ��:2018-3-13
# �ű�Ŀ��:���java����״̬
# �޸�ԭ��:[�޸���ע��ԭ��]
# �޸�ʱ��:[�޸���ע��ʱ��]
# �޸�����:[�޸���ע������]

VARS=$#
if [ $VARS -lt 2 ];
then
        echo "���봫��2������,��һ�������ǽ�������,�ڶ��������ǽ��̲���"
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
