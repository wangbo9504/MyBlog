package com.iwangbo.mapper;

import java.util.List;
import java.util.Map;

import com.iwangbo.model.Comment;

public interface CommentMapper {

    /*
     * 查找用户评论信息
     */
    List<Comment> list(Map<String, Object> map);
    
    /*
     * 插入一条评论信息
     */
    void add(Comment comment);
    
    /*
     * 得到总评论条数
     */
    int getTotal(Map<String, Object> map);
    
    /*
     * 删除评论信息
     */
    int delete(Integer id);
}
