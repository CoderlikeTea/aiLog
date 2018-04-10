package com.ai.extpara.impl;

import com.ai.appframe2.common.BaseSessionManager;
import com.ai.extpara.interfaces.ExtendPara;

import java.util.HashMap;


public class AppFrameExtendPara implements ExtendPara {
    public String opId;
    public String opCode;
    public String processName;

    /**
     基于AppFrame 获得当前业务对应的操作员编号
     */
    public String getOpId() {
        return this.opId = BaseSessionManager.__getUserWithOutLog() == null ? "" : String.valueOf(BaseSessionManager.__getUserWithOutLog().getID());
    }

    public String getOpCode() {
        return this.opCode = BaseSessionManager.__getUserWithOutLog() == null ? "" : String.valueOf(BaseSessionManager.__getUserWithOutLog().getCode());
    }

    /**
     基于AppFrame，获取JVM中的中心信息。
     后期传送到服务端作为文件名拼接
     */
    public String getProcessName() throws Exception {
        this.processName="";
        String aiLogFlag =  String.valueOf(System.getProperty("aiLogFlag"));
        if(aiLogFlag==null||aiLogFlag.equals("")){
            throw new Exception("请检查log4j.properites是否配置application节点");
        }

        String subAiLogFlag= "";

        subAiLogFlag = aiLogFlag.substring(aiLogFlag.length()-3,aiLogFlag.length());


        if(aiLogFlag.indexOf("cache") != -1){
            subAiLogFlag= aiLogFlag.substring(aiLogFlag.length()-5,aiLogFlag.length());;

        }

        if("exe".equals(subAiLogFlag)) {
            //TF和TASK得到的是task_code,对于bp而言获取当前业务的流水号
            this.processName = System.getProperty("taskCode") == null ? "" : String.valueOf(System.getProperty("taskCode"));

            return this.processName;
        }
        if("csf".equals(subAiLogFlag)){
            //获取csf对应的集群名称
            this.processName = System.getProperty("appframe.server.name") == null ? "" : String.valueOf(System.getProperty("appframe.server.name"));

            return this.processName;
        }
        if("msg".equals(subAiLogFlag)){
            //获取消息对应的集群名称
            this.processName = System.getProperty("appframe.server.name") == null ? "" : String.valueOf(System.getProperty("appframe.server.name"));

            return this.processName;
        }
        if("cache".equals(subAiLogFlag)){
            //获取缓存对应的集群名称
            this.processName = System.getProperty("appframe.server.name") == null ? "" : String.valueOf(System.getProperty("appframe.server.name"));

            return this.processName;
        }

        return this.processName;

    }




    public HashMap getExtPara() throws Exception {
        HashMap map = new HashMap();

        map.put("opId",getOpId());
        map.put("opCode",getOpCode());
        map.put("processName",getProcessName());

        return map;
    }

}
