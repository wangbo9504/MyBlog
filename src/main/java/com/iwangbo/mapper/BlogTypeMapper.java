package com.iwangbo.mapper;

import java.util.List;

import com.iwangbo.model.BlogType;

public interface BlogTypeMapper {
    /*
     * 查询博客类型及相关类型的博客数量
     */
    List<BlogType> countList();
}
