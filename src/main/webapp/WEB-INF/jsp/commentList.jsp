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
            <!-- A wrapper for all the blog posts -->
            <div class="posts">
                <h1 class="content-subhead">名师领读</h1>

                <!-- A single blog post -->


                <c:forEach items="${teacherComment}" var="teacherComment">

                <section class="post">
                    <header class="post-header">
                        <img width="48" height="48" alt="Tilo Mitra&#x27;s avatar" class="post-avatar" src="img/common/tilo-avatar.png">

                        <h2 class="post-title">${teacherComment.topic}</h2>

                        <p class="post-meta">
                            By <a href="<%=basePath%>comment/selectByUserId?userId=${teacherComment.userid}" class="post-author">${teacherComment.username}</a> under <a class="post-category post-category-design" href="<%=basePath%>comment/selectAllCommentByBook?bookid=${teacherComment.bookid}">${teacherComment.bookname}</a> <a class="post-category post-category-pure" href="#">Pure</a>
                        </p>
                    </header>

                    <div class="post-description">
                        <p>
                                ${teacherComment.content}
                        </p>
                    </div>
                </section>

                </c:forEach> <br/>
            </div>

            <div class="posts">
                <h1 class="content-subhead">思想碰撞</h1>


                <c:forEach items="${studentComment}" var="studentComment">



                <section class="post">
                    <header class="post-header">
                        <%--<img width="48" height="48" alt="Eric Ferraiuolo&#x27;s avatar" class="post-avatar" src="img/common/ericf-avatar.png">--%>

                        <h2 class="post-title"> ${studentComment.topic}</h2>

                        <p class="post-meta">
                            By <a class="post-author" href="<%=basePath%>comment/selectByUserId?userId=${studentComment.userid}"> ${studentComment.username}</a> under <a class="post-category post-category-js" href="<%=basePath%>comment/selectAllCommentByBook?bookid=${studentComment.bookid}">${studentComment.bookname}</a>
                        </p>
                    </header>

                    <div class="post-description">
                        <p>
                                ${studentComment.content}
                        </p>
                    </div>
                </section>
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
