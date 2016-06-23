package com.iwangbo.model;

/**
 * 博客类型实体类
 * @author 王博
 *
 */
public class BlogType {

    private Integer id; //编号
    private String typeName; //博客类型名称
    private Integer blogCount; //数量
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTypeName() {
        return typeName;
    }
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    public Integer getBlogCount() {
        return blogCount;
    }
    public void setBlogCount(Integer blogCount) {
        this.blogCount = blogCount;
    }
    
    
}
