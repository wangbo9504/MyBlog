package com.iwangbo.service.impl;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.iwangbo.model.Blog;
import com.iwangbo.model.BlogType;
import com.iwangbo.service.BlogService;
import com.iwangbo.service.BlogTypeService;

/*
 * 初始化组件 把博主信息 根据博客类别分类信息 根据日期归档分类信息 存放到application中，用以提供页面请求性能
 */
@Component
public class InitComponent implements ServletContextListener,ApplicationContextAware{

    private static ApplicationContext applicationContext;

    @SuppressWarnings("static-access")
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        // TODO Auto-generated method stub
        this.applicationContext=applicationContext;
    }
    
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext application = servletContextEvent.getServletContext();
        
        //将日志类别信息放入application生命周期中
        BlogService blogService = (BlogService) applicationContext.getBean("blogService");
        System.out.println(blogService);
        System.out.println("==================");
        List<Blog> blogDateList = blogService.countList();
        application.setAttribute("blogDateList", blogDateList);
        
        ////将日志时间信息放入application生命周期中
        BlogTypeService blogTypeService = (BlogTypeService) applicationContext.getBean("blogTypeService");
        System.out.println(blogTypeService);
        System.out.println("==================");
        List<BlogType> blogTypeList = blogTypeService.countList();
        application.setAttribute("blogTypeList", blogTypeList);
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        // TODO Auto-generated method stub
        
    }
    
    
}
