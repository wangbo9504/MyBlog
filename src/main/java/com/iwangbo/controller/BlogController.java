package com.iwangbo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.iwangbo.model.Blog;
import com.iwangbo.model.Comment;
import com.iwangbo.service.BlogService;
import com.iwangbo.service.CommentService;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Resource
    private BlogService blogService;
    @Resource
    private CommentService commentService;
    
    /*
     * 请求博客详细信息
     */
    @RequestMapping("/articles/{id}")
    public ModelAndView details(@PathVariable("id") Integer id) {
        ModelAndView mav = new ModelAndView();
        Blog blog = blogService.getById(id);
        mav.addObject("blog", blog);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("blogId", blog.getId());
        List<Comment> commentList = commentService.list(map);
        mav.addObject("commentList", commentList);
        mav.addObject("mainPage", "myPage/blog/view.jsp");
        mav.setViewName("main");
        return mav;
    }
}
