package com.iwangbo.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ResponseUtil {

    public static void write(HttpServletResponse resp,Object o) throws Exception {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.print(o.toString());
        out.flush();
        out.close();
    }
}
