package com.iwangbo.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.iwangbo.model.Blogger;
import com.iwangbo.service.BloggerService;

public class TestBlogger {

    private ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
    
    @Test
    public void testName() throws Exception {
       BloggerService bloggerService = (BloggerService)ac.getBean("bloggerService");
       Blogger blogger = bloggerService.find();
       System.out.println(blogger.getUserName());
    }
}
