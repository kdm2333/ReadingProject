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
    <link rel="stylesheet" href="<%=basePath%>css/pure/pure-min.css">
    <!--<![endif]-->
    <style>
        body{
            background: url(<%=basePath%>img/common/andrew-avatar.png) no-repeat;
            font-family: "Microsoft YaHei";
            overflow-y:hidden;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        form {
            margin: 150px auto;
            width: 300px;
        }
    </style>
</head>
<body>
<form action="<%=basePath%>user/regist" class="pure-form pure-g" method="post">
    <fieldset class="pure-group pure-u-1">
        <%--<input name="userId" type="text" class="pure-input-1" placeholder="用户名">
        <input name="password" type="passWord" class="pure-input-1" placeholder="密码">
    --%>
    <%--<div class="pure-group pure-input-1">
     <div class="pure-u-1-2"><img src="images/image.jpg"  height="40" width="140" /></div>
     <div class="pure-u-1-2">
     <input type="text" class="pure-input-1" placeholder="密码">
     </div>
   </div>--%>
    ${msg}<br>
    姓 名：<input name="username"  class="pure-input-1" placeholder="用户名"type="text"><br>
    账 号：<input name="userid"  class="pure-input-1" placeholder="用户名"type="text"><br>
    密码：<input name="password" class="pure-input-1" placeholder="用户名" type="passWord"><br>
    类型：<input type="checkbox"  class="pure-input-1" placeholder="用户名" name="type" VALUE="2">学生
    <input type="checkbox" name="type" class="pure-input-1" placeholder="用户名" value="1">老师
   <%-- <input type="submit" value="提交">--%>

    </fieldset>
    <div class="pure-group pure-input-1">
        <button type="submit" class="pure-button pure-input-1 pure-button-primary">注册</button>
    </div>
</form>
</body>
</html>
