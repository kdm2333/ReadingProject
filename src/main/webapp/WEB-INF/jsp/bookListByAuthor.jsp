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
    <title>Title</title>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=basePath%>css/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
    function to_page(page) {
        alert(page);
    $("#pageNum").val(page);
    $("#formSearch").submit();
    }
    </script>
</head>
<body>
<form  id="formSearch" action="<%=basePath%>book/selectAllBook">
<c:forEach items="${booklist}" var="book">
    ${book.bookname} ${book.author} ${book.press}<br>
</c:forEach> <br/>
<table style="width: 100%;">
    <tr>
        <td>当前第${booklist.pageNum }页，总共${booklist.pages }页，总共${booklist.total }条数据</td>
        <td style="float: right;">
            <nav>
                <ul class="pagination" style="margin: 0;">
                    <c:choose>
                        <c:when test="${!booklist.hasPreviousPage}">
                            <li class="disabled"><a href="javascript:void(0);"
                                                    aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="javascript:to_page(${booklist.pageNum -1 });"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach items="${booklist.navigatepageNums}" var="item">
                        <c:choose>
                            <c:when test="${booklist.pageNum==item }">
                                <li class="active"><a
                                        href="javascript:to_page(${item });"> ${item}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="javascript:to_page(${item });"> ${item}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${!booklist.hasNextPage}">
                            <li class="disabled"><a href="javascript:void(0);"
                                                    aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="javascript:to_page(${booklist.pageNum+1 });"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </td>
    </tr>
</table>
</form>
</body>
</html>
