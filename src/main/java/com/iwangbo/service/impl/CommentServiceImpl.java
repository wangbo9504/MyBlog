package com.iwangbo.service.impl;

import java.util.List;

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
    public List<Comment> list(int blogId) {
        return commentMapper.list(blogId);
    }

    @Override
    public void add(Comment comment) {
        commentMapper.add(comment);
        
    }
    
}
