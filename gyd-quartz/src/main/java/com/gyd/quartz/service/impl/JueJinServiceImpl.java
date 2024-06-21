package com.gyd.quartz.service.impl;

import com.gyd.common.utils.http.OkHttpUtils;
import com.gyd.common.utils.uuid.UUID;
import com.gyd.quartz.service.IJueJinService;

import java.util.HashMap;
import java.util.Map;

public class JueJinServiceImpl implements IJueJinService {

    @Override
    public void signIn() {
        Map<String,Object> params = new HashMap<>();
        params.put("aid",2608);
        params.put("uuid", UUID.randomUUID().toString().replaceAll("-",""));
        params.put("spider",0);
        params.put("msToken","SpCN8_JtiHRBM-MCMRPNyeZqDpoG8o-6PEghKyv2vSvsT1CoocAx5rqBk7kshXr7WiRuUr101NLCLL8RWAyvlPSC-hcTD7j-GMfgEVM-M1Js24r-BZ9RgIYKcX7_rA%3D%3D");
        params.put("a_bogus","Qj0Yvc2uMsm1p73Fb7kz9SgEAgD0YW4RgZEPezTXBUqz");

        Map<String,String> headers = new HashMap<>();
        headers.put("Cookie","sessionid=2312d0630013ae8c690d81a85ff866d9;");
        String url = "https://api.juejin.cn/growth_api/v1/check_in";
        OkHttpUtils.executePostRequestV2(url,headers,params);
    }

    public static void main(String[] args) {
        String sessionid = "d67bfb7e87a0ef673bb1433c0cb969a3";// 通过登录接口获取！！
        Map<String,Object> params = new HashMap<>();
//        params.put("aid",2608);
//        params.put("uuid", UUID.randomUUID().toString().replaceAll("-",""));
//        params.put("spider",0);
//        params.put("msToken","SpCN8_JtiHRBM-MCMRPNyeZqDpoG8o-6PEghKyv2vSvsT1CoocAx5rqBk7kshXr7WiRuUr101NLCLL8RWAyvlPSC-hcTD7j-GMfgEVM-M1Js24r-BZ9RgIYKcX7_rA%3D%3D");
//        params.put("a_bogus","Qj0Yvc2uMsm1p73Fb7kz9SgEAgD0YW4RgZEPezTXBUqz");

        Map<String,String> headers = new HashMap<>();
        headers.put("Cookie","sessionid="+sessionid+";");
        String url = "https://api.juejin.cn/growth_api/v1/check_in";
        String result = OkHttpUtils.executePostRequestV2(url,headers,params);
        System.out.println(result);
        //未登录 cookie失效场景
        //{
        //    "data": {
        //        "err_no": 403,
        //        "err_msg": "must login",
        //        "data": null
        //    },
        //    "err_msg": "",
        //    "err_no": 0
        //}

        //重复签到场景
//        {
//            "err_no": 15001,
//                "err_msg": "您今日已完成签到，请勿重复签到",
//                "data": null
//        }
    }
}
