package edu.nuc.controller;

import edu.nuc.entity.User;
import edu.nuc.service.LoginService;
import edu.nuc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.UUID;

/**
 * Created by 57180 on 2019/5/26.
 */


@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private UserService userService;


    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }


    @RequestMapping("/toRegist")
    public String toRegist() {
        return "regist";
    }


    /*
    **  用户登录
    */
    @RequestMapping(value = "/login")
    public String loginInfo(HttpServletRequest request) {
        String userId = (String) request.getParameter("userId");
        String passWord = (String) request.getParameter("password");
        System.out.printf(userId + ":" + passWord);
        boolean bool = loginService.selectByuserIdAndpassWord(userId, passWord);
        if (bool == false) {
            String msg = "用户名或密码输入错误，请重新输入";
            request.setAttribute("msg", msg);
            return "login";
        } else {
            HttpSession session = request.getSession();
            User usergg = loginService.selectUserByuserId(userId);
            session.setAttribute("user", usergg);
            return "redirect:../book/selectBookForMain";
        }
    }


    @RequestMapping(value = "/tomain")
    public String tomain(HttpServletRequest request) {

        return "redirect:../book/selectBookForMain";

    }


    /*
    **  用户注册
    */
    @RequestMapping("/regist")
    public String registUser(HttpServletRequest request, User user) {

        boolean bool = loginService.selectUserId(user.getUserid());
        if (bool) {
            request.setAttribute("msg", "用户已存在！");
            return "regist";
        }
        user.setCreatetime(new Date());
        loginService.registerUser(user);
        request.setAttribute("msg", "注册成功！请登录");
        return "login";

    }


    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/toLogin";
    }
}

