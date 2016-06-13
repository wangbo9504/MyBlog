package com.iwangbo.service;

import java.util.List;

import com.iwangbo.model.Comment;

public interface CommentService {

    /*
     * 查找用户评论信息
     */
    List<Comment> list(int blogId);
    
    /*
     * 插入一条评论信息
     */
    void add(Comment comment);
}
