package com.iwangbo.model;

/**
 * 博客类型实体类
 * @author 王博
 *
 */
public class BlogType {

    private int id; //编号
    private String typeName; //博客类型名称
    private int blogCount; //数量
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTypeName() {
        return typeName;
    }
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    public int getBlogCount() {
        return blogCount;
    }
    public void setBlogCount(int blogCount) {
        this.blogCount = blogCount;
    }
    
    
}
