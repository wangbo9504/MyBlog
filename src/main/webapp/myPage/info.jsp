<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人简历</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/styles/info.css" rel="stylesheet" />
</head>
<body>
    <!-- 左侧页面栏 -->
       <div class="left">
        <h1>王博</h1>
        <div class="photo">
            <img src="${pageContext.request.contextPath}/static/images/photo.png" />
        </div>
        <div class="details">
            <h3>PHONE</h3>
            <span>15680572881</span>
            <h3>EMAIL</h3>
            <span>wangbo9504@163.com</span>
            <h3>ADDRESS</h3>
            <span>成都理工大学</span>
        </div>
    </div>
    
    <!-- 右侧页面栏 -->
    <div class="right">
        <!-- 个人信息 -->
        <h3 class="clr1">个人基本信息</h3>
        <table class="table table-bordered table-hover table-responsive table-striped">
            <tr>
                <th>姓名:</th>
                <td>王博</td>
                <th>性别：</th>
                <td>男</td>
                <th>身高</th>
                <td>175cm</td>
            </tr>
            <tr>
                <th>专业：</th>
                <td>通信工程</td>
                <th>出生年月：</th>
                <td>1995-10-4</td>
                <th>籍贯：</th>
                <td>甘肃天水</td>
            </tr>
            <tr>
                <th>学历：</th>
                <td>本科</td>
                <th>就读学校：</th>
                <td>成都理工大学</td>
                <th>政治面貌：</th>
                <td>党员</td>
            </tr>
            <tr>
                <th>求职意向</th>
                <td colspan="5">JavaWeb后端工程师</td> 
            </tr>
            <tr>
                <th style="padding-top:45px">在校期间所获荣誉</th>
                <td colspan="5">英语四级证书<br>校级运动会"先进个人"<br>计算机四级网络工程师<br>成都理工大学"校优秀学生"<br>四川省通信创新大赛优秀奖</td>
            </tr>
            <tr>
                <th style="padding-top:45px">个人IT技能</th>
                <td colspan="5">1.熟悉Java语言的理论基础，对于面向对象的编程有深刻理解，能够熟练运用接口、继承、多态与集合框架，对于设计模式与GC机制也有一定了解<br>2.熟悉Struts2+Hibernate+Spring的整合开发并参与过相关OA项目的制作<br>3.熟悉SpringMVC+Mybatis的整合开发并用它搭建了个人博客<br>4.能够编写html+css+js页面，并且对Bootstrap、JQuery和JQueryEasyUI也有一定了解<br>5.能熟练运用Eclipse、Tomcat、Mysql、Maven等开发工具</td>
            </tr>
            <tr>
                <th style="padding-top:55px">自我评价</th>
                <td colspan="5">优点:<br>1.能够快速适应各种工作环境，具有良好的自学能力，善于思考<br>2.良好的编码风格、团队合作能力，较强的代码分析与源码阅读能力<br>3.为人踏实、诚恳，能吃苦耐劳，勇于面对困难与挑战<br>缺点：<br>性格有点内向，沟通能力不足，工作经验较少</td>
            </tr>
        </table>
        
        <!-- 项目经验 -->
        <h3 class="clr2">项目经验</h3>
        <div class="project">
            <h4>一、川勘院OA办公系统</h4>
            <h5>项目简介：</h5>
            <p>系统主要由人员管理、项目与合同管理、资金管理、招投标管理、系统权限管理、系统查询及统计等模块构成，采用MVC架构模式与抽象工厂设计模式，主要应用的技术有：</p>
            <p>表现层：JSP、JSTL+EL、bootstrap+jQuery</p>
            <p>控制层：Struts2与spring框架的整合</p>
            <p>数据访问与业务逻辑层：hibernate与spring框架的整合，运用SQL与HQL语句调用数据库数据</p>
            <h5>开发环境：</h5>
            <p>Myeclipse、Apache-Tomcat8、JDK8、chrome</p>
            <h5>项目感受：</h5>
            <p>这是我参与的第一个J2EE方面的项目，在做项目的过程中，我独立开发了项目管理与相应查询及统计模块，并通过团队协作吸收了老师与同学编写代码时的思想、同时也接触到了git、项目跟踪管理系统等等实际项目开发中要用到的工具。通过本项目让我对SSH框架有了深刻的认识。</p>
            <h4>二、小微Todo--基于Web的企业办公微平台</h4>
            <h5>项目简介：</h5>
            <p>小微Todo是一个基于Web Service的企业移动办公微平台，也即是一个SaaS平台，可以实现注册即拥有一套微型办公系统。主要功能有移动签到、会议通知推送、任务流程、发布公告、团队交流、日程管理等。</p>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>