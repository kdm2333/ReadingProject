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
            <h1 class="brand-title">${selectWords}</h1>
            <h2 class="brand-tagline">${book.description}</h2>

            <nav class="nav">
                <ul class="nav-list">

                    <li class="nav-item">
                        <a class="pure-button" href="<%=basePath%>login/tomain">返回首页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="content pure-u-1 pure-u-md-3-4">
        <div>
            <!-- A wrapper for all the blog posts -->
            <div class="posts">
                <h1 class="content-subhead">这些书可能是你需要的</h1>

                <!-- A single blog post -->


                <c:forEach items="${bookname}" var="book">

                <section class="post">
                    <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">
                        <ul>
                            <dd><img src="<%=basePath%>img/${book.pictureurl}" style="width:90px;height:150px" alt=""><br>
                                    ${book.bookname} BY ${book.author}<br></dd>
                        </ul>

                    </a>
                </section>

                </c:forEach> <br/>
            </div>

            <div class="posts">
                <h1 class="content-subhead">这些作者的书可能你会喜欢</h1>


                <c:forEach items="${bookauthor}" var="book">
                    <a href="<%=basePath%>comment/selectAllCommentByBook?bookid=${book.bookid}">
                        <ul>
                            <dd><img src="<%=basePath%>img/${book.pictureurl}" style="width:90px;height:150px" alt=""><br>
                                    ${book.bookname} BY ${book.author}<br></dd>
                        </ul>

                    </a>
                </c:forEach> <br/>

            </div>

            <div class="footer">
                <div class="pure-menu pure-menu-horizontal">
                    <ul>
                        <li class="pure-menu-item"><a href="http://purecss.io/" class="pure-menu-link">About</a></li>
                        <li class="pure-menu-item"><a href="http://twitter.com/yuilibrary/" class="pure-menu-link">Twitter</a></li>
                        <li class="pure-menu-item"><a href="http://github.com/pure-css/pure/" class="pure-menu-link">GitHub</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>




</body>
</html>
