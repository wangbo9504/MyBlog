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

import com.iwangbo.model.Blog;
import com.iwangbo.model.PageBean;
import com.iwangbo.service.BlogService;
import com.iwangbo.util.ResponseUtil;

@Controller
@RequestMapping("/admin/blog")
public class BlogAdminController {

    @Resource
    private BlogService blogService;
    
    @RequestMapping("/list")
    public String list(@RequestParam(value="page",required=false) String page,@RequestParam(value="rows",required=false) String rows,@RequestParam(value="title",required=false) String title,HttpServletResponse resp) throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("title", title);
        map.put("dbIndex", pageBean.getDbIndex());
        map.put("dbNumber", pageBean.getDbNumber());
        List<Blog> blogList = blogService.list(map);
        int total = blogService.getTotal(map);
        JSONObject result = new JSONObject();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONArray jsonArray = JSONArray.fromObject(blogList,jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(resp, result);
        return null;
    }
    
    @RequestMapping("/delete")
    public String delete(@RequestParam(value="ids") String ids,HttpServletResponse resp) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for(int i=0;i<idsStr.length;i++) {
            blogService.delete(Integer.parseInt(idsStr[i]));
        }
        result.put("success", "true");
        ResponseUtil.write(resp, result);
        return null;
    }
    
    @RequestMapping("/save")
    public String save(Blog blog,HttpServletResponse resp) throws Exception {
        JSONObject result = new JSONObject();
        int resultTotal = 0;
        if(blog.getId()==null) {
            resultTotal = blogService.add(blog);
        }else {
            resultTotal = blogService.update(blog);
        }
        if(resultTotal>0) {
            result.put("success", "true");
        }else {
            result.put("success", "false");
        }
        ResponseUtil.write(resp, result);
        return null;
    }
    
    @RequestMapping("/getById")
    public String getById(@RequestParam(value="id") String id,HttpServletResponse resp) throws Exception {
        Blog blog = blogService.getById(Integer.parseInt(id));
        JSONObject result = JSONObject.fromObject(blog);
        ResponseUtil.write(resp, result);
        return null;
    }
}
