package com.iwangbo.mapper;

import com.iwangbo.model.Blogger;

public interface BloggerMapper {

    /*
     * 查询博主信息
     */
    Blogger find();
    
    /*
     * 通过用户名查询用户
     */
    public Blogger getByUserName(String userName);
}
