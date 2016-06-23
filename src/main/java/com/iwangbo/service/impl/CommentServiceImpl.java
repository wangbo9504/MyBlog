package com.iwangbo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.iwangbo.mapper.CommentMapper;
import com.iwangbo.model.Comment;
import com.iwangbo.service.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentMapper commentMapper;

    @Override
    public List<Comment> list(Map<String, Object> map) {
        return commentMapper.list(map);
    }

    @Override
    public void add(Comment comment) {
        commentMapper.add(comment);
        
    }

    @Override
    public int getTotal(Map<String, Object> map) {
        return commentMapper.getTotal(map);
    }

    @Override
    public int delete(Integer id) {
        return commentMapper.delete(id);
    }
    
}
