package com.iwangbo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public ModelAndView index(@RequestParam(value="typeId",required=false) String typeId,@RequestParam(value="releaseDateStr",required=false) String releaseDateStr) {
        ModelAndView mav = new ModelAndView();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("typeId", typeId);
        map.put("releaseDateStr", releaseDateStr);
        mav.addObject("blogList", blogService.list(map));
        mav.addObject("pageTitle", "王博的博客");
        mav.addObject("mainPage", "myPage/blog/list.jsp");
        mav.setViewName("main");
        return mav;
    }
}
