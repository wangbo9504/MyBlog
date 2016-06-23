package com.iwangbo.util;

import org.apache.shiro.crypto.hash.Md5Hash;

public class CryptographyUtil {

    public static String md5(String str,String salt) {
        return new Md5Hash(str, salt).toString();
    }
    
    public static void main(String[] args) {
        String password = "wb123456";
        System.out.println("md5加密  :"+md5(password,"王博"));
    }
}
