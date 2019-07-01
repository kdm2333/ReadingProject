<%--
  Created by IntelliJ IDEA.
  User: 裴佳琦
  Date: 2019/5/27
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%@ page language="java" contentType="text/html; charset=utf-8"
                    pageEncoding="utf-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
        <!doctype html>
        <html>
        <head>
            <style>
                .head{
                    width:1500px;
                    height:100px;
                    background-color:white;
                    position:fixed;
                    top:0;
                }
                .logo{
                    width:400px;
                    height:100px;
                    background-color:#3c4e5c;
                    float:left;
                }
                #ul1{
                    width:500px;
                    list-style:none;
                    margin-left:1100px;
                    margin-top:50px;
                }
                li{
                    width:120px;
                    float:left;
                }
                .dd{
                    text-decoration:none;
                    display:block;
                    width:100px;
                    height:20px;
                    color:black;
                    text-align:center;
                    font-size:20px;
                }
                .dd:hover {
                    color:#FF00FF;
                }
                .nav{
                    width:1500px;
                    height:500px;
                    background-image:url(<%=basePath%>img/tp2.gif);

                }
                .zhuti{
                    width:500px;
                    height:200px;
                    background-color:white;
                    float:left;
                    margin-top:200px;
                    margin-left:1000px;
                    opacity:0.7;


                }
                .main{
                    width:1500px;
                    height:300px;
                    background-color:white;
                }
                .fk{
                    width:400px;
                    height:200px;
                    border:solid 2px red;
                    float:left;
                }
                .ct{
                    width:660px;
                    height:200px;
                    border:solid 2px white;
                    float:left;
                    margin-left:430px;
                }
                .img{
                    float:left;
                    margin-left:20px;
                }
                .footer{
                    width:1500px;
                    height:200px;
                    background-color:#FF6600;
                }
            </style>
        </head>
<body>
<div class="head">
    <div class="logo">
        <img src="<%=basePath%>img/tp1.gif">
    </div>
    <div id="div1">
        <ul id="ul1">
            <li>
                <a href="<%=basePath%>comment/selectTeacherComment" target="mainFrame" class="dd">名师领读</a>
            </li>
            <li>
                <a href="<%=basePath%>comment/selectTeacherComment" target="mainFrame" class="dd">名师领读</a>
            </li>
            <li>
                <a href="<%=basePath%>comment/selectStudentComment" target="mainFrame" class="dd">思想碰撞</a>
            </li>
            <li>
                <a href="<%=basePath%>comment/selectByUserId?userId=${sessionScope.user.userid}" target="mainFrame" class="dd">我的书评</a>
            </li>
            <%--<li>
                <a href="#" target="mainFrame" class="dd">${sessionScope.user.username}</a>
            </li>--%>
        </ul>
    </div>
</div>
<div class="nav">
    <div class="zhuti" style="font-size:60px">
        校园阅读汇
        <span style="font-size:45px">READING <br>
    COLLECTION</span>
    </div>
</div>
<div class="main">
    <div class="fk">
        书籍是人类进步的阶梯
    </div>
    <div class="ct">
        <a href="#"><img src="<%=basePath%>img/tp3.gif" class="img"></a>
        <a href="#"><img src="<%=basePath%>img/tp3.gif" class="img"></a>
        <a href="#"><img src="<%=basePath%>img/tp3.gif" class="img"></a>
    </div>
</div>
<div>
    最新上架
    <c:forEach items="${newbook}" var="book">
        <ul>

            <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">${book.bookname}</a>
            BY${book.author}<<br>
        </ul>
    </c:forEach>
</div>
<div>
    最热书籍
    <c:forEach items="${hotbook}" var="book">
        <ul>

            <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">${book.bookname}</a>
            BY${book.author}<<br>
        </ul>
    </c:forEach>


</div>
<div class="footer"></div>
</body>
</html></title>
</head>
<body>

</body>
</html>
