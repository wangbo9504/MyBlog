package com.iwangbo.service;

import java.util.List;

import com.iwangbo.model.BlogType;

public interface BlogTypeService {
    /*
     * 查询博客类型及相关类型的博客数量
     */
    List<BlogType> countList();
}
