package com.iwangbo.service;

import java.util.List;
import java.util.Map;

import com.iwangbo.model.BlogType;

public interface BlogTypeService {
    /*
     * 查询博客类型及相关类型的博客数量
     */
    List<BlogType> countList();
    
    /*
     * 获取总记录数
     */
    int getTotal(Map<String,Object> map);
    
    /*
     * 查询博客类别信息
     */
    List<BlogType> list(Map<String, Object> map); 
    
    /*
     * 批量删除博客类别信息
     */
    int delete(List<Integer> ids);
    
    /*
     * 添加博客类别
     */
    int save(BlogType blogType);
    
    /*
     * 更新博客类别
     */
    int update(BlogType blogType);
}
