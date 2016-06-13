package com.iwangbo.mapper;

import java.util.List;
import java.util.Map;

import com.iwangbo.model.Blog;

public interface BlogMapper {

    /*
     * 查询博客信息
     */
    List<Blog> list(Map<String, Object> map);
    
    /*
     * 根据发布时间归档博客信息
     */
    List<Blog> countList();
    
    /*
     * 根据id查询博客
     */
    Blog getById(int id);
    
    /*
     * 获取总记录数
     */
    int getTotal(Map<String,Object> map);
}
