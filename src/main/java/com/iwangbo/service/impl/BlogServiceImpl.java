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

    @Override
    public int getTotal(Map<String, Object> map) {
        return blogMapper.getTotal(map);
    }

    @Override
    public boolean getBlogByTypeId(String id) {
        int num = blogMapper.getBlogByTypeId(id);
        if(num>0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public int delete(Integer id) {
        return blogMapper.delete(id);
    }

    @Override
    public int add(Blog blog) {
        return blogMapper.add(blog);
    }

    @Override
    public int update(Blog blog) {
        return blogMapper.update(blog);
    }
    
    
}
