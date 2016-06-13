package com.iwangbo.model;

import java.util.Date;

/*
 * 评论实体类
 */
public class Comment {

    private int id; //用户编号
    private String userIp; //用户Ip
    private String content; //评论内容
    private Blog blog; //被评论的博客
    private Date commentDate; //评论日期
   
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getUserIp() {
        return userIp;
    }
    public void setUserIp(String userIp) {
        this.userIp = userIp;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Blog getBlog() {
        return blog;
    }
    public void setBlog(Blog blog) {
        this.blog = blog;
    }
    public Date getCommentDate() {
        return commentDate;
    }
    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }
    
    
}
