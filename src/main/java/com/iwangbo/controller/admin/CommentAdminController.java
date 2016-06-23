package com.iwangbo.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iwangbo.model.Comment;
import com.iwangbo.model.PageBean;
import com.iwangbo.service.CommentService;
import com.iwangbo.util.ResponseUtil;

@Controller
@RequestMapping("/admin/comment")
public class CommentAdminController {

    @Resource
    private CommentService commentService;
    
    @RequestMapping("/list")
    public String list(@RequestParam(value="page") String page,@RequestParam(value="rows") String rows,HttpServletResponse resp) throws Exception {
        JSONObject result = new JSONObject();
        PageBean pageBean = new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("dbIndex", pageBean.getDbIndex());
        map.put("dbNumber", pageBean.getDbNumber());
        List<Comment> commentList = commentService.list(map);
        int total = commentService.getTotal(map);
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONArray jsonArray = JSONArray.fromObject(commentList, jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(resp, result);
        return null;
    }
    
    @RequestMapping("delete")
    public String delete(@RequestParam(value="ids") String ids,HttpServletResponse resp) throws Exception{
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for(int i=0;i<idsStr.length;i++) {
            commentService.delete(Integer.parseInt(idsStr[i]));
        }
        result.put("success", "true");
        ResponseUtil.write(resp, result);
        return null;
    }
}
