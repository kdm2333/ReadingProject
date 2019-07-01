<%@ page language="java" contentType="text/html; charset=utf-8"
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a blog page with a list of posts.">
    <title>Blog &ndash; Layout Examples &ndash; Pure</title>

    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-" crossorigin="anonymous">

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-old-ie-min.css">
    <![endif]-->
    <!--[if gt IE 8]><!-->
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css">
    <!--<![endif]-->


    <!--[if lte IE 8]>
    <link rel="stylesheet" href="../css/layouts/blog-old-ie.css">
    <![endif]-->
    <!--[if gt IE 8]><!-->
    <link rel="stylesheet" href="<%=basePath%>css/pure/pure.css">
    <style>
        .head{
            width:1600px;
            height:100px;
            background-color:white;
            position:fixed;
            top:0;
            z-index: 999;
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
            margin-left:1000px;
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
            width:1600px;
            height:700px;
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
<div>
    <div class="head">
        <div class="logo">
            <img src="<%=basePath%>img/tp1.gif">
        </div>
        <div id="div1">
            <ul id="ul1">
                <li>
                    <form action="<%=basePath%>select/select" method="post">
                        <input name="selectWords" type="text" placeholder="请输入书名或作者进行查找">
                        <button type="submit">查找<button>
                    </form>
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
            校园阅读汇<br>
            <span style="font-size:35px">READING
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

    <div >
        最新上架
         <c:forEach items="${newbook}" var="book">
             <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">
                 <ul>
                     <dd><img src="<%=basePath%>img/${book.pictureurl}" style="width:90px;height:150px" alt=""><br>
                             ${book.bookname} BY ${book.author}<br></dd>
                 </ul>
             </a>
          </c:forEach>
    </div>

    测试
    <div class="pure-g">
        <c:forEach items="${hotbook}" var="book">
            <div class="pure-u-1-5">
                <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">
                    <ul>
                        <dd><img src="<%=basePath%>img/${book.pictureurl}" style="width:150px;height:200px" alt=""><br>
                                ${book.bookname} BY ${book.author}<br></dd>
                    </ul>
                </a>
            </div>
        </c:forEach>
    </div>

<br>

    <div>
    最热书籍
        <c:forEach items="${hotbook}" var="book">
            <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">
                <ul>
                    <dd><img src="<%=basePath%>img/${book.pictureurl}" style="width:90px;height:150px" alt=""><br>
                    ${book.bookname} BY ${book.author}<br></dd>
                </ul>
            </a>
        </c:forEach>
    </div>

    <div class="footer">
    </div>

</div>
</body>
</html>