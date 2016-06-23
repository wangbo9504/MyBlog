package com.iwangbo.controller.admin;

import java.util.ArrayList;
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

import com.iwangbo.model.BlogType;
import com.iwangbo.model.PageBean;
import com.iwangbo.service.BlogService;
import com.iwangbo.service.BlogTypeService;
import com.iwangbo.util.ResponseUtil;

@Controller
@RequestMapping("/admin/blogType")
public class BlogTypeAdminController {

    @Resource
    private BlogTypeService blogTypeService;
    @Resource
    private BlogService blogService;
    
    @RequestMapping("/list")
    public String list(@RequestParam(value="page") String page,@RequestParam(value="rows") String rows,HttpServletResponse resp) throws Exception {
        PageBean pageBean = new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("dbIndex", pageBean.getDbIndex());
        map.put("dbNumber", pageBean.getDbNumber());
        List<BlogType> blogTypeList = blogTypeService.list(map);
        int total = blogTypeService.getTotal(map);
        JSONObject result = new JSONObject();
        JsonConfig jsonConfig = new JsonConfig();
        jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONArray jsonArray = JSONArray.fromObject(blogTypeList, jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(resp, result);
        return null;
    }
    
    @RequestMapping("/delete")
    public void delete(@RequestParam(value="ids") String ids,HttpServletResponse resp) throws Exception {
        JSONObject result = new JSONObject();
        
        //遍历传来的id检查每个博客类别是否被外键关联，是则提示错误信息
        String[] idsStr = ids.split(",");
        for(int i=0;i<idsStr.length;i++) {
            boolean f = blogService.getBlogByTypeId(idsStr[i]);
            if(f) {
                result.put("errorIndex", i);
                result.put("errorMsg", "类别下面有博客，无法删除");
                ResponseUtil.write(resp, result);
                return;
            }
        }
        
        //把前台传来的String型id列表转化为List,以便Mybatis进行批量删除操作
        List<Integer> idsList = new ArrayList<Integer>();
        if(idsStr!=null&&idsStr.length>0) {
            for(String str:idsStr) {
                idsList.add(Integer.parseInt(str));
            }
        }
        
        int delNumber = blogTypeService.delete(idsList);
        if(delNumber>0) {
            result.put("success", "true");
            result.put("delNumber", delNumber);
        } else {
            result.put("errorMsg", "操作失败!");
        }
        ResponseUtil.write(resp, result);
    }
    
    @RequestMapping("/save")
    public String save(BlogType blogType,HttpServletResponse resp) throws Exception {
        JSONObject result = new JSONObject();
        int resultTotal = 0; //记录操作数
        if(blogType.getId()==null) {
            resultTotal = blogTypeService.save(blogType);
        }else {
            resultTotal = blogTypeService.update(blogType);
        }
        if(resultTotal>0) {
            result.put("success", "true");
        }else {
            result.put("errorMsg", "操作失败!");
        }
        ResponseUtil.write(resp, result);
        return null;
    }
}
