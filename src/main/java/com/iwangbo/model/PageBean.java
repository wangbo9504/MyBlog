package com.iwangbo.model;

/*
 * 分页对应的实体
 */
public class PageBean {

    //用于前台分页
    public PageBean(int page,int pageNumber,int totalNumber) {
        super();
        this.page = page;
        this.pageNumber = pageNumber;
        this.totalNumber = totalNumber;
        this.count();
    }

    //用于后台分页，经过EasyUI封装，所以相对简单
    public PageBean(int page, int pageNumber) {
        super();
        this.page = page;
        this.pageNumber = pageNumber;
        this.dbIndex = (this.page - 1) * this.pageNumber;
        this.dbNumber = this.pageNumber;
    }



    /*
     * 总条数
     */
    private int totalNumber;
    /*
     * 当前第几页
     */
    private int page;
    /*
     * 总页数
     */
    private int totalPage;
    /*
     * 每页显示条数
     */
    private int pageNumber;
    /*
     * 数据库中limit的参数，从第几条开始取
     */
    private int dbIndex;
    /*
     * 数据库中limit的参数，一共取多少条
     */
    private int dbNumber;
    
    /*
     * 根据当前对象中属性值计算并设置相关属性值
     */
    public void count() {
        //计算总页数
        int totalPageTemp = this.totalNumber/this.pageNumber;
        int plus = (this.totalNumber%this.pageNumber) == 0 ? 0 : 1;
        totalPageTemp = totalPageTemp + plus;
        if(totalPageTemp <= 0) {
            totalPageTemp = 1;
        }
        this.totalPage = totalPageTemp;
        
        //设置当前页数
        //总页数小于当前页面，应将当前页数设置为总页数
        if(this.totalPage < this.page) {
            this.page = this.totalPage;
        }
        //当前页数小于1则设置为1
        if(page < 1) {
            this.page = 1;
        }
        
        //设置limit的参数
        this.dbIndex = (this.page - 1) * this.pageNumber;
        this.dbNumber = this.pageNumber;
    }

    public int getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(int totalNumber) {
        this.totalNumber = totalNumber;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getDbIndex() {
        return dbIndex;
    }

    public void setDbIndex(int dbIndex) {
        this.dbIndex = dbIndex;
    }

    public int getDbNumber() {
        return dbNumber;
    }

    public void setDbNumber(int dbNumber) {
        this.dbNumber = dbNumber;
    }
    
    
}
