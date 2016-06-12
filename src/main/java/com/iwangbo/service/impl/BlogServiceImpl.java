package com.iwangbo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.iwangbo.mapper.BlogMapper;
import com.iwangbo.model.Blog;
import com.iwangbo.service.BlogService;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

    @Resource
    private BlogMapper blogMapper;

    @Override
    public List<Blog> list(Map<String, Object> map) {
        return blogMapper.list(map);
    }

    @Override
    public List<Blog> countList() {
        return blogMapper.countList();
    }

    @Override
    public Blog getById(int id) {
        return blogMapper.getById(id);
    }
    

}
