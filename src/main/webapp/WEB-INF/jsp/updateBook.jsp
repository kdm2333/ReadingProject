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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="<%=basePath%>css/layui/css/layui.css">
    <script src="<%=basePath%>css/layui/layui.js" charset="utf-8"></script>
    <title>添加图书</title>
</head>
<body>
<%--<form action="<%=basePath%>book/addbook" method="post">
    书名：<input name="bookname" type="text" placeholder="书名">
    作者：<input name="author" type="text" placeholder="作者">
    出版社：<input name="press" type="text" placeholder="出版社">
    分类：<input type="checkbox"  class="" placeholder="分类" name="booktype" VALUE="1">外国文学
    <input type="checkbox" name="booktype" class=""  value="2">国内名作
    简介：（二十字以内）<input name="description" type="text" placeholder="简介">
    电子书书地址：<input name="contenturl" type="text" placeholder="电子书">
    图片地址：<input name="pictureurl" type="text" placeholder="图片">
    纸质书：<input type="checkbox"  class="" placeholder="是否藏书" name="isentity" VALUE="0">馆内暂无
    <input type="checkbox" name="isentity" class=""  value="1">馆藏书籍
    <button type="submit" >添加</button>

</form>--%>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;" >
    <legend>添加新的图书信息以加入评论系统</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="<%=basePath%>book/updateBook" method="post"  enctype="multipart/form-data">


    <input name="bookid" id="bookid" type="hidden" value="${book.bookid}" >

    <div class="layui-inline">
        <span><img style="width:150px;height:200px" src="<%=basePath%>img/${book.pictureurl}"></span>
    </div>
    <div class="layui-upload">
        更换图书封面<input type="file" name="pic" placeholder="上传图书封面" >
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图书名称</label>
        <div class="layui-input-block">
            <input name="bookname" class="layui-input" type="text" placeholder="请输入标题" autocomplete="off" value="${book.bookname}">
        </div>
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">作者</label>
        <div class="layui-input-inline">
            <input name="author" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required" value="${book.bookname}">
    </div>
</div>
    <div class="layui-inline">
        <label class="layui-form-label">出版社</label>
        <div class="layui-input-inline">
            <input name="press" class="layui-input" type="text" autocomplete="off" value="${book.press}">
        </div>
    </div>
    </div>

    <%--<div class="layui-form-item">
        <label class="layui-form-label">出版社</label>
        <div class="layui-input-inline">
            <input name="press" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
        </div>
    </div>--%>
<c:choose>
    <c:when test="${book.booktype==1}" ><div class="layui-form-item" pane="">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input name="booktype" title="外国文学" type="radio" checked="" value="1">
            <input name="booktype" title="国内文学" type="radio" value="2">
        </div>
    </div></c:when>
    <c:when test="${book.booktype==2}" ><div class="layui-form-item" pane="">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input name="booktype" title="外国文学" type="radio"  value="1">
            <input name="booktype" title="国内文学" type="radio" checked="" value="2">
        </div>
    </div></c:when>
    <c:otherwise><div class="layui-form-item" pane="">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input name="booktype" title="国内文学" type="radio"  value="1">
            <input name="booktype" title="外国文学" type="radio" checked="" value="2">
        </div>
    </div></c:otherwise>
</c:choose>

    <c:choose>
        <c:when test="${book.isentity==0}"> <div class="layui-form-item" pane="">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input name="isentity" title="馆内暂无" type="radio" checked="" value="0">
                <input name="isentity" title="馆藏图书" type="radio" value="1">
            </div>
        </div></c:when>
        <c:when test="${book.isentity==1}"><div class="layui-form-item" pane="">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input name="isentity" title="馆内暂无" type="radio"  value="0">
                <input name="isentity" title="馆藏图书" type="radio" checked="" value="1">
            </div>
        </div></c:when>
        <c:otherwise><div class="layui-form-item" pane="">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input name="isentity" title="馆内暂无" type="radio" checked="" value="0">
                <input name="isentity" title="馆藏图书" type="radio"  value="1">
            </div>
        </div></c:otherwise>
    </c:choose>






    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">文本域</label>
        <div class="layui-input-block">
            <textarea name="description" class="layui-textarea" value="${book.description}" placeholder="请输入30字以内的简介">${book.description}</textarea>
            <div class="layui-form-mid layui-word-aux">请输入30字以内的简介</div>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" type="submit" lay-filter="demo2" lay-submit="">跳转式提交</button>
    </div>
</form>

<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });

        //表单初始赋值
        form.val('example', {
            "username": "贤心" // "name": "value"
            ,"password": "123456"
            ,"interest": 1
            ,"like[write]": true //复选框选中状态
            ,"close": true //开关状态
            ,"sex": "女"
            ,"desc": "我爱 layui"
        })


    });
</script>

</body>
</html>
