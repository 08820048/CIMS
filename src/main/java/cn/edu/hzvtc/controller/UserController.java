package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.pojo.Area;
import cn.edu.hzvtc.pojo.ReturnMsg;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.AreaService;
import cn.edu.hzvtc.service.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private AreaService areaService;


    /**
     * 登录
     */
    @RequestMapping("/login")
    @ResponseBody
    public ReturnMsg login(@RequestParam(value = "userName", required = true) String userName,
                           @RequestParam(value = "userPassword", required = true) String userPassword,
                           HttpSession session) {

//        System.out.println("加密前的密码:"+userPassword);
        //用户名密码为空，登录失败，返回登录页
        if (userName == null || userPassword == null) {
            return ReturnMsg.fail();
        }
//        String pwd = DigestUtils.md5DigestAsHex(userPassword.getBytes());
       // System.out.println("加密后的密码:"+pwd);
        //从数据库中获取用户名和密码后进行判断
        User loginUser = userService.login(userName, userPassword);

        if(loginUser != null){
            session.setAttribute("loginUser", loginUser);
            System.out.println(session.getId());
            ReturnMsg returnMsg = ReturnMsg.success();
            if (loginUser.getUserType() == 1) {
                returnMsg.setTarget("area/areaIndex");
            } else if (loginUser.getUserType() == 2) {
                returnMsg.setTarget("unit/unitIndex");
            } else if (loginUser.getUserType() == 3) {
                returnMsg.setTarget("msg/msgIndex");
            } else {
                returnMsg.setTarget("");
            }
            return returnMsg;
        }else{
            /*密码错误*/
            return ReturnMsg.fail().add("fieldErrors", "密码错误");
        }

        //登录成功
//        if (loginUser != null) {
//            if (loginUser.getUserPassword().equals(pwd)) {
//                session.setAttribute("loginUser", loginUser);
//                System.out.println(session.getId());
//
//                ReturnMsg returnMsg = ReturnMsg.success();
//                if (loginUser.getUserType() == 1) {
//                    returnMsg.setTarget("area/areaIndex");
//                } else if (loginUser.getUserType() == 2) {
//                    returnMsg.setTarget("unit/unitIndex");
//                } else if (loginUser.getUserType() == 3) {
//                    returnMsg.setTarget("msg/msgIndex");
//                } else {
//                    returnMsg.setTarget("");
//                }
//                return returnMsg;
//            } else {
//                /*密码错误*/
//                return ReturnMsg.fail().add("fieldErrors", "密码错误");
//            }
//        } else {
//            /*用户不存在*/
//            return ReturnMsg.fail().add("fieldErrors", "用户不存在");
//        }
    }

    /**
     * 获取登录用户信息
     */
    @RequestMapping("/loginUser")
    @ResponseBody
    public ReturnMsg loginUser(HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        System.out.println("****************" + session.getId() + "********" + loginUser.toString());

        /*添加所有地区*/
        Area area = loginUser.getArea();
        String areaAll = "";
        if (area != null) {
            do {
                System.out.println(area.getAreaName());
                areaAll = area.getAreaName() + " " + areaAll;
                area = area.getParentArea();
            } while (area != null);
            /*清除最后一个空格*/
            areaAll = areaAll.substring(0, areaAll.length() - 1);
        }

        return ReturnMsg.success().add("loginUser", loginUser).add("areaAll", areaAll);
    }

    /**
     * 注销
     */
    @RequestMapping("/logout")
    @ResponseBody
    public ReturnMsg logout(HttpSession session) {
        /*清楚session*/
        session.invalidate();
        /*重定向到登录页面的跳转方法*/
        ReturnMsg returnMsg = ReturnMsg.success();
        returnMsg.setTarget("../");
        return returnMsg;
    }

    /**
     * 分页查询方法
     * @param provinceId 省
     * @param cityId 市
     * @param schoolId 学校
     * @param userName 用户
     * @param pn 页码
     * @return 分页结果
     */
    @RequestMapping("/areaAdmins")
    @ResponseBody
    public ReturnMsg getAreaAdmis(@RequestParam(value = "provinceId",required = false) Integer provinceId,
                                  @RequestParam(value = "cityId",required = false) Integer cityId,
                                  @RequestParam(value = "schoolId",required = false) Integer schoolId,
                                  @RequestParam(value = "userName",required = false) String userName,
                                  @RequestParam(value = "pn",defaultValue = "1",required = false) Integer pn){
        /*引入分页插件*/

        /*1.在进行分页查询之前传入一个页码以及每一页的大小*/
        PageHelper.startPage(pn,5);
        /*2.后跟一个分页查询*/
        List<User> areaAdmins = userService.getAreaAdmins(provinceId, cityId, schoolId, userName);
        /*3.使用PageInfo封装查询结果，封装分页信息和查询出的数据，将PAgeInfo给页面即可*/
        PageInfo pageInfo = new PageInfo<>(areaAdmins, 5);
        return ReturnMsg.success().add("pageInfo",pageInfo);
    }

    /**
     * 删除管理员以及所有相关信息
     * @param ids 管理员id
     * @return 删除反馈信息
     */
    @RequestMapping(value = "/areaAdmin/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg delAreaAdmin(@PathVariable("ids") String ids) {
        if (userService.delAreaAdmin(ids)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

    /**
     * 修改获取用户的信息
     * @param id 用户id
     * @return 修改结果反馈
     */
    @RequestMapping(value = "/areaAdmin", method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg getAreaAdmin(@RequestParam(value = "id") Integer id) {
        User areaAdmin = userService.getUserById(id);
        if (areaAdmin != null) {
            return ReturnMsg.success().add("areaAdmin", areaAdmin);
        }
        return ReturnMsg.fail();
    }

    /**
     * 新增院校管理员
     * @param user 管理员
     * @param result 新增结果
     * @param session 用户session
     * @return 新增结果反馈
     */
    @RequestMapping(value = "/areaAdmin", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg save(@Valid User user, BindingResult result, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        user.setUserOperatorId(loginUser.getId());
        user.setUserOperatorTime(new Date());
        user.setUserType(2);
        user.setUserDelState(0);

        System.out.println(user.toString());
        if (userService.addAreaAdmin(user)) {
            return ReturnMsg.success();
        }

        return ReturnMsg.fail();
    }

    /**
     * 修改院校管理员信息
     * @param areaAdminId 管理员id
     * @param user        修改信息
     * @return 结果反馈
     */
    @RequestMapping(value = "/areaAdmin/{areaAdminId}", method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg update(@PathVariable("areaAdminId") Integer areaAdminId,
                            @RequestParam(value = "userAreaIdOld") Integer userAreaIdOld,
                            @Valid User user, BindingResult result, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        user.setId(areaAdminId);
        user.setUserOperatorId(loginUser.getId());
        user.setUserOperatorTime(new Date());
        user.setUserType(2);
        user.setUserDelState(0);
        if (user.getUserAreaId() == null) {
            user.setUserAreaId(userAreaIdOld);
        }
        if (userService.modifyAreaAdmin(user)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

    /**
     * 判断用户名是否重复
     * @param username 用户名
     * @return 结果反馈
     */
    @RequestMapping(value = "/validName", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg validName(@RequestParam(value = "username") String username) {
        User user = userService.getUserByUsername(username);
        if (user != null) {
            return ReturnMsg.success().add("user", user);
        } else {
            return ReturnMsg.fail().add("fieldErrors", "用户不存在");
        }
    }

    /**
     * 重置密码
     * @param id 用户id
     * @return 结果反馈
     */
    @RequestMapping(value = "/passwordReset", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg passwordReset(@RequestParam(value = "id") Integer id) {
        if (userService.passwordReset(id)) {
            return ReturnMsg.success();
        } else {
            return ReturnMsg.fail();
        }
    }


    /**
     * 获取用户列表
     * @param pn 页码
     * @param session 用户session
     * @return 结果反馈
     */
    @RequestMapping("/user")
    @ResponseBody
    public ReturnMsg getUser(@RequestParam(value = "unitTypeId", defaultValue = "0") Integer unitTypeId,
                             @RequestParam(value = "unitId", defaultValue = "0") Integer unitId,
                             @RequestParam(value = "userName", defaultValue = "") String userName,
                             @RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        PageHelper.startPage(pn, 5);
        List<User> users = userService.getUsers(unitTypeId, unitId, userName, user.getUserAreaId());
        PageInfo pageInfo = new PageInfo(users, 5);

        return ReturnMsg.success().add("pageInfo", pageInfo);
    }
}