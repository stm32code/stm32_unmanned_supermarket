package com.bs.glr.controller;

import com.bs.glr.bean.BsUser;
import com.bs.glr.bean.EchartBean;
import com.bs.glr.bean.ResultBean;
import com.bs.glr.service.EchartService;
import com.bs.glr.service.GoodsSeervice;
import com.bs.glr.service.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @作者 GLQ
 * @时间 2022-05-01 23:47
 * @描述 ${var}
 */
@RestController
@RequestMapping("/auth/echart")
public class EchartController {

    @Resource
    EchartService echartService;

    @Resource
    UserService userService;

    @Resource
    GoodsSeervice goodsSeervice;


    /**
     * @Author GLQ
     * @desc //获取物品分类饼状图数据
     * @Date  2022/12/13
     **/
    @RequestMapping("getSortChart")
    public ResultBean getSortChart (){
        List<EchartBean> echartBeans = goodsSeervice.getSortChart();
        return ResultBean.returnOk().pushData("data",echartBeans);
    }


    /**
     * @Author GLQ
     * @desc //获取销售额统计
     * @Date  2022/12/13
     **/
    @RequestMapping("getBookCountByUid")
    public ResultBean getBookCountByUid (String uid){
        List<EchartBean> echartBeans = goodsSeervice.getBalanceChart();
        List<String> xData = new ArrayList<>();
        List<Integer> yData = new ArrayList<>();

        for (EchartBean echartBean : echartBeans) {
            xData.add(echartBean.getName());
            yData.add(echartBean.getValue());
        }
        return ResultBean.returnOk().pushData("xData",xData).pushData("yData",yData);
    }


}
