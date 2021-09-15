package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.pojo.Area;
import cn.edu.hzvtc.pojo.ReturnMsg;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.AreaService;
import cn.edu.hzvtc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


@Controller
public class UserController {

    @Autowired
    private UserService userService;
    private AreaService areaService;

    @RequestMapping("login")
    @ResponseBody
    public ReturnMsg login(@RequestParam(value = "userName",required = true) String userName,
                           @RequestParam(value = "userPassword",required = true) String userPassword,
                           HttpSession session){

        if (userName == null || userPassword == null){
            return ReturnMsg.fail();
        }
        User loginUser=userService.login(userName,userPassword);
//        Area areaUser=areaService.loginArea(loginUser.getId());
        if (loginUser != null){
            session.setAttribute("loginUser",loginUser);
//            session.setAttribute("loginArea",areaUser);
            System.out.println(session.getId());

            ReturnMsg returnMsg = ReturnMsg.success();
            if (loginUser.getUserType() == 1){
                returnMsg.setTarget("area/areaIndex");
            }else  if (loginUser.getUserType() == 2){
                returnMsg.setTarget("unit/unitIndex");
            }else  if (loginUser.getUserType() == 3){
                returnMsg.setTarget("msg/msgIndex");
            }else {
                returnMsg.setTarget("");
            }
            return returnMsg;
        }else {
            return ReturnMsg.fail();
        }
    }

    @RequestMapping("/loginUser")
    @ResponseBody
    public ReturnMsg loginUser(HttpSession session){
        User loginUser=(User) session.getAttribute("loginUser");
        System.out.println(session.getId());
        return ReturnMsg.success().add("loginUser",loginUser);
    }

    @RequestMapping("/logout")
    @ResponseBody
    public ReturnMsg logout(HttpSession sessions){
        sessions.invalidate();
        ReturnMsg returnMsg=ReturnMsg.success();
        returnMsg.setTarget("../");

        return returnMsg;
    }
}
