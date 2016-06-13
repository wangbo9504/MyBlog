package com.iwangbo.util;

import com.iwangbo.model.PageBean;

public class PageUtil {

    public static Object genPagination(String targetUrl, PageBean pageBean,String param) {
        int totalNum = pageBean.getTotalNumber();
        int currentPage = pageBean.getPage();
        int totalPage = pageBean.getTotalPage();
        if(totalNum==0) {
            return "未查询到数据";
        } else {
            StringBuilder pageCode = new StringBuilder();
            pageCode.append("<li><a href='"+targetUrl+"?page=1&"+param+"'>首页</a></li>");
            if(pageBean.getPage()>1) {
                pageCode.append("<li><a href='"+targetUrl+"?page="+(pageBean.getPage()-1)+"&"+param+"'>上一页</a></li>");
            } else {
                pageCode.append("<li class='disabled'><a href='"+targetUrl+"?page="+(pageBean.getPage()-1)+"&"+param+"'>上一页</a></li>"); 
            }
            for(int i=currentPage-2;i<=currentPage+2;i++){
                if(i<1||i>totalPage){
                    continue;
                }
                if(i==currentPage){
                    pageCode.append("<li class='active'><a href='"+targetUrl+"?page="+i+"&"+param+"'>"+i+"</a></li>");  
                }else{
                    pageCode.append("<li><a href='"+targetUrl+"?page="+i+"&"+param+"'>"+i+"</a></li>"); 
                }
            }
            if(currentPage<totalPage){
                pageCode.append("<li><a href='"+targetUrl+"?page="+(currentPage+1)+"&"+param+"'>下一页</a></li>");     
            }else{
                pageCode.append("<li class='disabled'><a href='"+targetUrl+"?page="+(currentPage+1)+"&"+param+"'>下一页</a></li>");    
            }
            pageCode.append("<li><a href='"+targetUrl+"?page="+totalPage+"&"+param+"'>尾页</a></li>");
            return pageCode.toString();
        }
        
    }
}
