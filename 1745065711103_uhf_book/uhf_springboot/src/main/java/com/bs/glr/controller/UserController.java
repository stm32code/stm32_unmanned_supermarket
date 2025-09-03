package com.bs.glr.controller;

import com.alibaba.druid.util.StringUtils;
import com.bs.glr.bean.BsUser;
import com.bs.glr.bean.ResultBean;
import com.bs.glr.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author glr
 * @create 2021-01-31 14:08
 * @desc ${var}
 */
@RestController
public class UserController {
    @Resource
    UserService userService;
    @Autowired
    private StringRedisTemplate redisTemplate;

    @RequestMapping("/user/login")
    public ResultBean login(String uname, String pwd) {

        if (StringUtils.isEmpty(uname) || StringUtils.isEmpty(pwd)) {
            return ResultBean.returnError().pushMessage("请将用户名和密码输入完整");
        }

        List<BsUser> userList = userService.getUserByUname(uname);
        if (userList == null || userList.size() == 0) {
            return ResultBean.returnError().pushMessage("用户不存在");
        }


        if (!userList.get(0).getPwd().equals(pwd)) {
            return ResultBean.returnError().pushMessage("用户名或密码不正确");
        }
        String uuid = UUID.randomUUID().toString();


//        redisTemplate.opsForValue().set("user_token:" + uuid, uname);
        userService.loginToken(uuid, userList.get(0).getId());

        return ResultBean.returnOk().pushData("token", uuid);
    }


    @RequestMapping("/auth/add_user")
    public ResultBean register(String uname, String phone, String age, String rfid) {

        if (StringUtils.isEmpty(phone)) {
            return ResultBean.returnError("请输入手机号");
        }
        if (StringUtils.isEmpty(rfid)) {
            return ResultBean.returnError("请输入RFID");
        }
        try {
            Integer.parseInt(age);
        } catch (NumberFormatException e) {
            return ResultBean.returnError("年龄必须为数字");
        }
        //校验用户名是否存在
        List<BsUser> userByUname = userService.getUserByUname(uname);
        if (userByUname != null && userByUname.size() > 0) {
            return ResultBean.returnError().pushMessage("用户名已经存在，请重新输入");
        }
        //插入用户表
        BsUser user = new BsUser();
        user.setPwd("0");
        user.setUname(uname);
        user.setRfid(rfid);
        user.setUage(age);
        user.setUbalance(new Double(0));
        user.setUphone(phone);
        user.setIdentity("1");

        Integer uid = userService.insertUserBean(user);

        //插入token表
        String token = UUID.randomUUID().toString();
        userService.insertToken(uid, token);

        return ResultBean.returnOk().pushData("token", token).pushMessage("注册成功");
    }


    //用户查询
    @RequestMapping("/auth/selectUserList")
    public ResultBean selectUserList(Integer page, Integer limit) {

        if (page == null) {
            page = 1;
        }
        if (limit == null) {
            limit = 10;
        }

        PageInfo<BsUser> pageInfo = userService.selectUserListByPage(page, limit);
        long total = pageInfo.getTotal();
        List<BsUser> list = pageInfo.getList();

        List<BsUser> returnList = new ArrayList<>();


        return ResultBean.returnOk().pushData("total", total).pushData("list", returnList);
    }


    //用户删除
    @RequestMapping("/auth/deleteUser")
    public ResultBean deleteUser(Integer delUid) {

        userService.deleteUserById(delUid);

        return ResultBean.returnOk().pushMessage("删除成功");
    }

    //修改用户密码
    @RequestMapping("/auth/updatePwdByUid")
    public ResultBean updatePwdByUid(Integer uid, String pwd) {

        BsUser bsUser = userService.selectUserByUid(uid);
        if (bsUser == null) {
            return ResultBean.returnError().pushMessage("用户不存在");
        }
        userService.updatePwdByUid(uid, pwd);

        return ResultBean.returnOk().pushMessage("修改成功");
    }

    /**
     * @Author L H
     * @desc //获取信息
     * @Date 2021/2/20
     **/
    @RequestMapping("/auth/info")
    public ResultBean changePwd(String token) {
        BsUser user = userService.getUserByToken(token);
        if (user == null) {
            return ResultBean.returnError("用户不存在");
        }

        String role = "";

        if ("0".equals(user.getIdentity())) {
            role = "man";
        } else {
            role = "pan";
        }

        if (user != null) {
            return ResultBean.returnOk().pushData("name", user.getUname()).pushData("avatar", "https://scwtest20200706.oss-cn-beijing.aliyuncs.com/jd.jpg")
                    .pushData("roles", role);
        }
        return ResultBean.returnError();
    }


    @RequestMapping("/auth/getUserListByCondition")
    public ResultBean getUserListByCondition(String username, String phone, Integer page, Integer limit) {
        if (page == null) {
            page = 1;
        }
        if (limit == null) {
            limit = 10;
        }


        PageInfo<BsUser> pageInfo = userService.getUserListByCondition(username, phone, page, limit);
        long total = pageInfo.getTotal();
        List<BsUser> list = pageInfo.getList();

        return ResultBean.returnOk().pushData("total", total).pushData("list", list);
    }

    /**
     * @Author GLQ
     * @desc //根据uid获取用户信息
     * @Date 2022/4/30
     **/
    @RequestMapping("/auth/getUserInfoByUid")
    public ResultBean getUserInfoByUid(Integer userUId) {
        BsUser userById = userService.getUserById(userUId);
        return ResultBean.returnOk().pushData("data", userById);
    }

    /**
     * @Author GLQ
     * @desc //更新用户信息
     * @Date 2022/4/30
     **/
    //uid,uname,phone,age,rfid
    @RequestMapping("/auth/updateUserAllInfo")
    public ResultBean updateUserAllInfo(Integer changeId, String uname, String phone, String age, String rfid) {

        try {
            Integer.parseInt(age);
        } catch (NumberFormatException e) {
            return ResultBean.returnError("年龄必须为数字");
        }

        if (StringUtils.isEmpty(phone)) {
            return ResultBean.returnError("请输入手机号");
        }
        if (StringUtils.isEmpty(rfid)) {
            return ResultBean.returnError("请输入RFID");
        }

        if (StringUtils.isEmpty(uname)) {
            return ResultBean.returnError("请输入用户名");
        }

//,String uname, String phone,String age,String rfid
        BsUser user = new BsUser();
        user.setId(changeId);
        user.setUphone(phone);
        user.setUname(uname);
        user.setUage(age);
        user.setRfid(rfid);

        Integer line = userService.updateUserAllInfo(user);
        if (line > 0) {
            return ResultBean.returnOk();
        }
        return ResultBean.returnError();


    }


    /**
     * @Author GLQ
     * @desc //根据token获取用户信息
     * @Date 2022/4/30
     **/
    @RequestMapping("/auth/getUserInfoByToken")
    public ResultBean getUserInfoByToken(Integer uid) {

        BsUser userById = userService.getUserById(uid);
        return ResultBean.returnOk().pushData("data", userById);

    }

    @RequestMapping("/auth/pay")
    public ResultBean pay(Integer payId, String payAmt) {
        double amt = 0;
        try {
             amt = Double.parseDouble(payAmt);
        } catch (NumberFormatException e) {
            return ResultBean.returnError("充值金额必须为数字!");
        }

        BsUser userById = userService.getUserById(payId);
        if(userById == null){
            return ResultBean.returnError("用户不存在!");
        }

        Double ubalance = userById.getUbalance();
        ubalance = ubalance + amt;
        BsUser bsUser = new BsUser();
        bsUser.setId(userById.getId());
        bsUser.setUbalance(ubalance);
        userService.updateUserAllInfo(bsUser);
        return ResultBean.returnOk("充值成功");
    }


}
