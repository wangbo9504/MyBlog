package com.iwangbo.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iwangbo.model.Blog;
import com.iwangbo.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Resource
    private BlogService blogService;
    
    /*
     * 请求博客详细信息
     */
    @RequestMapping("/articles/{id}")
    public ModelAndView details(@PathVariable("id") Integer id) {
        ModelAndView mav = new ModelAndView();
        Blog blog = blogService.getById(id);
        mav.addObject("blog", blog);
        mav.addObject("mainPage", "myPage/blog/view.jsp");
        mav.setViewName("main");
        return mav;
    }
}
