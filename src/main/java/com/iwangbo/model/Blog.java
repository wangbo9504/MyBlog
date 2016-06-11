package com.iwangbo.model;

import java.util.Date;

/**
 * 博客实体类
 * @author 王博
 *
 */
public class Blog {
    private int id; //编号
    private String title; //标题
    private String summary; //摘要
    private Date releaseDate; //发布日期
    private String content; //博客内容
    private BlogType blogType; //博客类型
    
    private Integer blogCount; // 博客数量 非博客实际属性，主要是 根据发布日期归档查询博客数量用
    private String releaseDateStr; // 发布日期字符串 只取年和月
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getSummary() {
        return summary;
    }
    public void setSummary(String summary) {
        this.summary = summary;
    }
    public Date getReleaseDate() {
        return releaseDate;
    }
    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public BlogType getBlogType() {
        return blogType;
    }
    public void setBlogType(BlogType blogType) {
        this.blogType = blogType;
    }
    public Integer getBlogCount() {
        return blogCount;
    }
    public void setBlogCount(Integer blogCount) {
        this.blogCount = blogCount;
    }
    public String getReleaseDateStr() {
        return releaseDateStr;
    }
    public void setReleaseDateStr(String releaseDateStr) {
        this.releaseDateStr = releaseDateStr;
    }
    
    
}
