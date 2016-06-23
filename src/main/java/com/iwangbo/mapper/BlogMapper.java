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
    
    /*
     * 查询传入的博客类别是否被外键关联外键关联(这里只返回int值，boolean判断放在Service中判断)
     */
    int getBlogByTypeId(String id);
    
    /*
     * 删除博客
     */
    int delete(Integer id);
    
    /*
     * 添加博客
     */
    int add(Blog blog);
    
    /*
     * 修改博客
     */
    int update(Blog blog);
}
