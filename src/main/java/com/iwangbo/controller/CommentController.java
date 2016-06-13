package com.iwangbo.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iwangbo.model.Comment;
import com.iwangbo.service.CommentService;

/*
 * 评论Controller层
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    @Resource
    private CommentService commentService;
    
    /*
     * 通过AJAX异步提交验证码判断后存入评论信息
     */
    @RequestMapping("/save")
    public String save(Comment comment,@RequestParam("imageCode") String imageCode,@RequestParam("content") String content,HttpServletRequest req,HttpServletResponse resp,HttpSession session) throws Exception {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        JSONObject result = new JSONObject();
        String sRand = (String)session.getAttribute("sRand");
        if(!sRand.equals(imageCode)) {
            result.put("success", false);
            result.put("errorInfo", "验证码错误!");
        } else {
            String userIp = req.getRemoteAddr();
            comment.setUserIp(userIp);
            commentService.add(comment);
            result.put("success", true);
        }
        out.write(result.toString());
        out.flush();  
        out.close();
        return null;
    }
}
