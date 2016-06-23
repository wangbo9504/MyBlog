package com.iwangbo.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.iwangbo.model.Blog;
import com.iwangbo.model.BlogType;
import com.iwangbo.service.BlogService;
import com.iwangbo.service.BlogTypeService;
import com.iwangbo.util.ResponseUtil;

@Controller
@RequestMapping("/admin/system")
public class SystemAdminController {

    @Resource
    private BlogService blogService;
    
    @Resource
    private BlogTypeService blogTypeService;
    
    @RequestMapping("/refreshSystem")
    public String refreshSystem(HttpServletRequest req,HttpServletResponse resp) throws Exception {
        ServletContext application = RequestContextUtils.getWebApplicationContext(req).getServletContext();
        
        //重新生成日志时间信息
        List<Blog> blogDateList = blogService.countList();
        application.setAttribute("blogDateList", blogDateList);
        
        //重新生成日志类别信息
        List<BlogType> blogTypeList = blogTypeService.countList();
        application.setAttribute("blogTypeList", blogTypeList); 
        
        JSONObject result = new JSONObject();
        result.put("success", "true");
        ResponseUtil.write(resp, result);
        return null;
    }
}
