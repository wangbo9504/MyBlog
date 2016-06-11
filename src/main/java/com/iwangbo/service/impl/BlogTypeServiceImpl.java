package com.iwangbo.service.impl;

import java.util.List;

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

    
}
