package com.bs.glr.conf;

import com.bs.glr.MsgUtils;
import com.bs.glr.service.UserService;
import com.github.pagehelper.PageInfo;

import lombok.extern.slf4j.Slf4j;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @作者 GLQ
 * @时间 2021-06-18 14:16
 * @描述 ${var}
 */
@Slf4j
@Component
public class MiuiverJob extends QuartzJobBean {


    @Resource
    UserService userService;

    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {


    }

}
