<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html lang="en">
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
    <link rel="stylesheet" href="<%=basePath%>css/layouts/blog.css">
    <!--<![endif]-->
</head>
<body>

<div id="layout" class="pure-g">
    <div class="sidebar pure-u-1 pure-u-md-1-4">
        <div class="header">
            <h1 class="brand-title">${book.bookname}</h1>
            <h2 class="brand-tagline">${book.description}</h2>

            <nav class="nav">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a class="pure-button" href="<%=basePath%>book/selectBookByAuthor?author=${book.author}">${book.author}</a>
                    </li>
                    <li class="nav-item">
                        <a class="pure-button" href="<%=basePath%>comment/toInsertComment?bookid=${book.bookid}">留下足迹</a>
                    </li>
                    <li class="nav-item">
                        <a class="pure-button" href="<%=basePath%>login/tomain">返回首页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="content pure-u-1 pure-u-md-3-4">
        <div>
            <span>${msg}</span>
            <form class="pure-form" action="<%=basePath%>comment/insertComment" method="post">


                <fieldset class="pure-group">
                    <input name="topic" type="text" class="pure-input-1" placeholder="标题">
                    <textarea name="content" class="pure-input-1" placeholder="简评                  "></textarea>
                    <input name="bookid" style="display:none" type="text" class="pure-input-1-2" value="${book.bookid}">
                </fieldset>

                <button type="submit" class="pure-button pure-input-1 pure-button-primary">发布</button>
            </form>
    </div>
</div>




</body>
</html>
