package com.iwangbo.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iwangbo.model.Blogger;
import com.iwangbo.service.BloggerService;
import com.iwangbo.util.CryptographyUtil;
import com.iwangbo.util.ResponseUtil;

@Controller
@RequestMapping("/admin/blogger")
public class BloggerAdminController {

    @Resource
    private BloggerService bloggerService;
    
    @RequestMapping("/modifyPassword")
    public String modifyPassword(@RequestParam(value="newPassword") String newPassword,HttpServletResponse resp) throws Exception {
        JSONObject result = new JSONObject();
        Blogger blogger = new Blogger();
        blogger.setPassword(CryptographyUtil.md5(newPassword, "王博"));
        int resultTotal = bloggerService.update(blogger);
        if(resultTotal>0) {
            result.put("success", "true");
        }else {
            result.put("success", "false");
        }
        ResponseUtil.write(resp, result);
        return null;
    }
    
    @RequestMapping("/logout")
    public String logout() throws Exception {
        SecurityUtils.getSubject().logout();
        return "redirect:/login.jsp";
    }
}
