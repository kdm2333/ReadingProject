<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="<%=basePath%>test/upload" method="post" enctype="multipart/form-data">
    书名：<input name="bookname" type="text" placeholder="书名"><br>

    上传图片：<input type="file" name="pic"><br>

    作者：<input name="author" type="text" placeholder="作者"><br>
    出版社：<input name="press" type="text" placeholder="出版社"><br>
    分类：<input type="checkbox"  class="" placeholder="分类" name="booktype" VALUE="1">外国文学<br>
    <input type="checkbox" name="booktype" class=""  value="2">国内名作<br>
    简介：（二十字以内）<input name="description" type="text" placeholder="简介"><br>
    电子书书地址：<input name="contenturl" type="text" placeholder="电子书"><br>
    图片地址：<input name="pictureurl" type="text" placeholder="图片"><br>
    纸质书：<input type="checkbox"  class="" placeholder="是否藏书" name="isentity" VALUE="0">馆内暂无<br>
    <input type="checkbox" name="isentity" class=""  value="1">馆藏书籍<br>
    <button type="submit" >添加</button><br>

</form>
</body>
</html>
