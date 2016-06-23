package com.iwangbo.realm;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.iwangbo.model.Blogger;
import com.iwangbo.service.BloggerService;

public class MyRealm extends AuthorizingRealm{

    @Resource
    private BloggerService bloggerService;
    
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException {
        String currentUser = (String)token.getPrincipal();
        Blogger blogger = bloggerService.getByUserName(currentUser);
        if(blogger!=null) {
            SecurityUtils.getSubject().getSession().setAttribute("currentUser", blogger);
            AuthenticationInfo authInfo = new SimpleAuthenticationInfo(blogger.getUserName(),blogger.getPassword(),"xx");
            return authInfo;
        }else {
            return null;
        }
    }

    
}
