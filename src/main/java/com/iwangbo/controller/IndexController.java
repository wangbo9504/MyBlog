package com.iwangbo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.iwangbo.model.PageBean;
import com.iwangbo.service.BlogService;
import com.iwangbo.service.BlogTypeService;
import com.iwangbo.util.PageUtil;

@Controller
public class IndexController {

    @Resource
    private BlogService blogService;
    @Resource
    private BlogTypeService blogTypeService;
    
    @RequestMapping("/index")
    public ModelAndView index(@RequestParam(value="page",required=false) String page,
            @RequestParam(value="typeId",required=false) String typeId,
            @RequestParam(value="releaseDateStr",required=false) String releaseDateStr,
            HttpServletRequest req) {
        
        //添加分类信息
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("typeId", typeId);
        map.put("releaseDateStr", releaseDateStr);
        
        //添加分页信息
        if(page==null||"".equals(page.trim())){
            page = "1";
        }
        //添加查询参数
        StringBuilder param = new StringBuilder();
        if(typeId!=null&&!"".equals(typeId.trim())){
            param.append("typeId="+typeId+"&");
        }
        if(releaseDateStr!=null&&!"".equals(releaseDateStr.trim())){
            param.append("releaseDateStr="+releaseDateStr+"&");
        }
        PageBean pageBean = new PageBean(Integer.valueOf(page),5,blogService.getTotal(map));
        map.put("dbIndex", pageBean.getDbIndex());
        map.put("dbNumber", pageBean.getDbNumber());
        mav.addObject("pageCode", PageUtil.genPagination(req.getContextPath()+"/index.html",pageBean,param.toString()));
        
        //添加视图
        mav.addObject("blogList", blogService.list(map));
        mav.addObject("pageTitle", "王博的博客");
        mav.addObject("mainPage", "myPage/blog/list.jsp");
        mav.setViewName("main");
        return mav;
    }
}
