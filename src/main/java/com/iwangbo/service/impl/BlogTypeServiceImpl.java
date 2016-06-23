package com.iwangbo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.iwangbo.mapper.BlogTypeMapper;
import com.iwangbo.model.BlogType;
import com.iwangbo.service.BlogTypeService;

@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {

    @Resource
    private BlogTypeMapper blogTypeMapper;
    
    @Override
    public List<BlogType> countList() {
        return blogTypeMapper.countList();
    }

    @Override
    public int getTotal(Map<String, Object> map) {
        return blogTypeMapper.getTotal(map);
    }

    @Override
    public List<BlogType> list(Map<String, Object> map) {
        return blogTypeMapper.list(map);
    }

    @Override
    public int delete(List<Integer> ids) {
        return blogTypeMapper.delete(ids);
    }

    @Override
    public int save(BlogType blogType) {
        return blogTypeMapper.save(blogType);
    }

    @Override
    public int update(BlogType blogType) {
        return blogTypeMapper.update(blogType);
    }
    
   
}
