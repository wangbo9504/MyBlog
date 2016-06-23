package com.iwangbo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.iwangbo.model.Blogger;
import com.iwangbo.service.BloggerService;
import com.iwangbo.util.CryptographyUtil;

@Controller
@RequestMapping("/blogger")
public class BloggerController {

    @Resource
    private BloggerService bloggerService;
    
    @RequestMapping("/login")
    private String login(Blogger blogger,HttpServletRequest req) {
        Subject currentUser = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(
                blogger.getUserName(),
                CryptographyUtil.md5(blogger.getPassword(), "王博")
                );
        try {
            currentUser.login(token);
            System.out.println("登陆成功");
            return "redirect:/adminPage/main.jsp";
        }catch(Exception e) {
            e.printStackTrace();
            req.setAttribute("errorInfo", "用户名或密码错误");
            return "login";
        }
    }
}
