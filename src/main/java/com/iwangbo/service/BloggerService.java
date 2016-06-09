package com.iwangbo.service;

import com.iwangbo.model.Blogger;

public interface BloggerService {

    /*
     * 查询博主信息
     */
    Blogger find();
    
    /*
     * 通过用户名查询用户
     */
    public Blogger getByUserName(String userName);
}
