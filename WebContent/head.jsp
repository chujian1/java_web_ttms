<!DOCTYPE HTML>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在此处插入标题</title>
</head>
<body>
<div class="page-header">
    <div class="row">
        <div class="col-md-9">
            <h1 style="text-align: center">初见TTMS</h1>
        </div>
        <div class="col-md-3">
        <ul class="nav nav-tabs">
         <li><span class="glyphicon glyphicon-user"></span></li>
            <li><a href="#">${sessionScope.name}</a></li>
            <li><a href="${pageContext.request.contextPath}/LoginOutServlet">退出</a></li>
            <li id="headImg"></li>
        </ul>
           
        </div>
    </div>
</div>
</script>
</body>
</html>