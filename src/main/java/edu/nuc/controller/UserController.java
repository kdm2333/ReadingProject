package edu.nuc.controller;/**
 * Created by 57180 on 2019/5/18.
 */

import edu.nuc.entity.User;
import edu.nuc.service.LoginService;
import edu.nuc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private UserService userService;

    /*
    ** 权限分配
    */
    @RequestMapping("/powerManage")
    @ResponseBody
    public void powerManage(HttpServletRequest request,String userId,int type){
        User user = new User();
        user.setUserid(userId);
        user.setType(type);
        boolean bool = userService.updateUser(user);
        if(bool){
            request.setAttribute("msg","修改成功!");
        }else{
            request.setAttribute("msg","修改失败!");
        }

    }


}
