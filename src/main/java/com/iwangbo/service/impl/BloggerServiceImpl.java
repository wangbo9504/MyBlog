package com.iwangbo.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.iwangbo.mapper.BloggerMapper;
import com.iwangbo.model.Blogger;
import com.iwangbo.service.BloggerService;

@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService{

    @Resource
    private BloggerMapper bloggerMapper;
    
    @Override
    public Blogger find() {
        return bloggerMapper.find();
    }

    @Override
    public Blogger getByUserName(String userName) {
        return bloggerMapper.getByUserName(userName);
    }

    @Override
    public Integer update(Blogger blogger) {
        return bloggerMapper.update(blogger);
    }
    
    

}
