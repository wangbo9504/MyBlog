package com.iwangbo.mapper;

import java.util.List;

import com.iwangbo.model.Blog;

public interface BlogMapper {

    /*
     * 查询博客信息
     */
    List<Blog> list();
    
    /*
     * 根据发布时间归档博客信息
     */
    List<Blog> countList();
}
