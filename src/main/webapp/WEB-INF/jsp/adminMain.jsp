<%@ page language="java" contentType="text/html; charset=utf-8"
           pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>阅读汇后台管理</title>
    <link rel="stylesheet" href="<%=basePath%>css/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<script src="<%=basePath%>css/layui/layui.js"></script>
<script>
    $("#a").click(function(){
        $.ajax({
            url:"<%=basePath%>book/selectAllBook",
            cache:false,
            contentType : 'application/json; charset=utf-8',
            data:JSON.stringify(booklist),
            type:"post",
            success:function(result){
                alert(result.name);
            }
        });
    });


</script>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">阅读汇后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${sessionScope.user.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="<%=basePath%>login/logout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">管理书籍</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=basePath%>book/selectAllBook"   target="mainFrame">书籍列表</a></dd>
                        <dd><a href="<%=basePath%>admin/toaddbook"  target="mainFrame">添加书籍</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"  >评论管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=basePath%>comment/selectCommentBySearch"  target="mainFrame">评论列表</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item"><a href=""  target="mainFrame">用户管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <iframe name="mainFrame" src="<%=basePath %>bookList" frameborder=0 style="width:1300px;height:600px;margin-left:5px;"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>

<script src="<%=basePath%>css/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>

</body>
</html>