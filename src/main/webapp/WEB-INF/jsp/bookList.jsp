<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">

    <link rel="stylesheet" href="<%=basePath%>css/layui/css/layui.css">
    <script src="<%=basePath%>css/layui/layui.js" charset="utf-8"></script>


    <title>Title</title>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=basePath%>css/jquery-1.11.1.min.js"></script>
    <script type="text/javascript"
            src="<%=basePath%>css/bootstrap.js"></script>
    <script type="text/javascript">
    function to_page(page) {
        alert(page);
    $("#pageNum").val(page);
    $("#formSearch").submit();
    }
    </script>
</head>
<body>
<div class="container-fluid">
<form  id="formSearch" action="<%=basePath%>book/selectAllBook">
<input name="pageNum" id="pageNum" type="hidden" value=" ${search.pageNum }" >

        ${msg}<br>
        <div class="layui-inline">
            <label class="layui-form-label">书名：</label>
            <div class="layui-input-inline">
                <input  name="bookname" value="${search.bookname}" class="layui-input" type="text" placeholder="    请输入活动开始时间">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">作者：</label>
            <div class="layui-input-inline">
                <input name="author" class="layui-input" value="${search.author}"  type="text" placeholder="    请输入活动结束时间">
            </div>
        </div>
    <div class="layui-inline">
        <label class="layui-form-label">出版社：</label>
        <div class="layui-input-inline">
            <input name="press" class="layui-input" value="${search.press}"   type="text" placeholder="    请输入活动结束时间">
        </div>
    </div>
        <div class="layui-inline">
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp图书状态：
            <div class="layui-input-inline">
                <select name="status"  id="">
                    <option <c:if test="${search.status=='0'}" >selected="selected"</c:if> value="0">全部</option>
                    <option <c:if test="${search.status=='1'}" >selected="selected"</c:if> value="1">有效</option>
                    <option <c:if test="${search.status=='2'}" >selected="selected"</c:if> value="2">无效</option>
                </select>
            </div>

        </div>

        <div class="layui-inline">
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp书籍分类：
            <div class="layui-input-inline">
                <select name="booktype" >
                    <option <c:if test="${search.booktype=='0'}" >selected="selected"</c:if> value="0">全部</option>
                    <option <c:if test="${search.booktype=='1'}" >selected="selected"</c:if> value="1">国内文学</option>
                    <option <c:if test="${search.booktype=='2'}" >selected="selected"</c:if> value="2">国外文学</option>
                </select>
            </div>

        </div>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <div class="layui-inline">
            <input type="submit" value="查找" class="but2">
        </div>
    </form>

    <div class="layui-form">
        <table class="layui-table">
            <colgroup>
                <col width="150">
                <col width="200">
                <col>
            </colgroup>
            <thead>
            <tr>
            <th>图书名称</th>
            <th>作者</th>
            <th>出版社</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="book">
            <tr>
                <td>${book.bookname}</td>
                <td>${book.author}</td>
                <td>${book.press}</td>

                <td>
                    <c:if test="${book.status==1}">

                        <a href="<%=basePath%>book/selectBookById?bookId=${book.bookid}">修改</a>
                        <a href="<%=basePath%>book/updateBookStatus?bookId=${book.bookid}&status=2">暂停使用</a>
                      <%--  <button type="button" class="btn btn-danger">暂停使用</button>--%>
                    </c:if>
                    <c:if test="${book.status==2}">

                        <a href="<%=basePath%>book/selectBookById?bookId=${book.bookid}">修改</a>
                        <a href="<%=basePath%>book/updateBookStatus?bookId=${book.bookid}&status=1">恢复使用</a>
                        <%--  <button type="button" class="btn btn-danger">暂停使用</button>--%>
                    </c:if>

                    <%--<a href="<%=basePath%>book/selectBookById?bookId=${book.bookid}">详情</a>
                    <button type="button" class="btn btn-danger">暂停使用</button>--%>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
<div class="container-fluid">
    <table style="width: 100%;">
        <tr>
            <td>当前第${page.pageNum }页，总共${page.pages }页，总共${page.total }条数据</td>
            <td style="float: right;">
                <nav>
                    <ul class="pagination" style="margin: 0;">
                        <c:choose>
                            <c:when test="${!page.hasPreviousPage}">
                                <li class="disabled"><a href="javascript:void(0);"
                                                        aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                </a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="javascript:to_page(${page.pageNum -1 });"
                                       aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                </a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach items="${page.navigatepageNums}" var="item">
                            <c:choose>
                                <c:when test="${page.pageNum==item }">
                                    <li class="active"><a
                                            href="javascript:to_page(${item });"> ${item}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="javascript:to_page(${item });"> ${item}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${!page.hasNextPage}">
                                <li class="disabled"><a href="javascript:void(0);"
                                                        aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="javascript:to_page(${page.pageNum+1 });"
                                       aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </td>
        </tr>
    </table>
</div>
</div>
</form>
</div>

</body>
</html>
