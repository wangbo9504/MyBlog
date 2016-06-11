package com.iwangbo.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iwangbo.service.BlogService;
import com.iwangbo.service.BlogTypeService;

@Controller
public class IndexController {

    @Resource
    private BlogService blogService;
    @Resource
    private BlogTypeService blogTypeService;
    
    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("blogList", blogService.list());
        mav.addObject("blogTypeList", blogTypeService.countList());
        mav.addObject("blogDateList", blogService.countList());
        mav.addObject("pageTitle", "王博的博客");
        mav.addObject("mainPage", "myPage/blog/list.jsp");
        mav.setViewName("main");
        return mav;
    }
}
