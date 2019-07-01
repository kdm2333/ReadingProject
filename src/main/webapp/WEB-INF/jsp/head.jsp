<%--
  Created by IntelliJ IDEA.
  User: 裴佳琦
  Date: 2019/5/24
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%--
  Created by IntelliJ IDEA.
  User: 57180
  Date: 2019/5/18
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive photo gallery.">
    <title>Photo Gallery &ndash; Layout Examples &ndash; Pure</title>

    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-" crossorigin="anonymous">

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-old-ie-min.css">
    <![endif]-->
    <!--[if gt IE 8]><!-->
    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css">
    <!--<![endif]-->


    <!--[if lte IE 8]>
    <link rel="stylesheet" href="css/layouts/gallery-old-ie.css">
    <![endif]-->
    <!--[if gt IE 8]><!-->
    <link rel="stylesheet" href="<%=basePath%>css/pure/pure.css">
    <!--<![endif]-->
</head>
<body>







<div>
    <div class="header">
        <div class="pure-menu pure-menu-horizontal">
            <a href="#" class="pure-menu-heading pure-menu-link">中北大学阅读汇</a>
            <ul class="pure-menu-list">
                <li class="pure-menu-item"><a href="<%=basePath%>user/tomain" class="pure-menu-link">图书简评</a></li>
                <li class="pure-menu-item"><a href="<%=basePath%>user/selectByUser" class="pure-menu-link">我的书评</a></li>
            </ul>
        </div>
    </div>

<%--

    <div class="footer">
        View the source of this layout to learn more. Made with love by the YUI Team.
    </div>
</div>


--%>


</body>
</html>
</html>
