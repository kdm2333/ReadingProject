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
    <script type="text/javascript" src="<%=basePath%>css/jquery-1.11.1.min.js"></script>
    <script>
            $('#file-fr').fileinput({
                    theme : 'fa',
                    language : 'zh',
                    uploadAsync : true,//异步上传
                    uploadUrl : 'upload.do',
                   allowedFileExtensions : [ 'jpg', 'png', 'gif', 'mp4' ],
                  maxFileSize : 0,
                 maxFileCount : 1
         }).on("fileuploaded", function(event, data) { //异步上传成功结果处理
               $("#userimage").val(data.response.src);
             })
        </script>
</head>
<body>

<form action="<%=basePath%>book/updateBook" method="post">
    <input type="hidden" id="userimage" name="userimage" value="" />
    <div class="file-loading">
       <input id="file-fr" name="file" type="file" multiple>
                     </div>
    <button type="submit" >修改</button>

</form>

</body>
</html>
