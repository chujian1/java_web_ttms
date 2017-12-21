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
            <h1 style="text-align: center">TTMS</h1>
        </div>
        <div class="col-md-3">
        <ul class="nav nav-tabs">
            <li><a href="#">${sessionScope.name}</a></li>
            <li><a href="${pageContext.request.contextPath}/LoginOutServlet">退出</a></li>
            <li id="headImg"><img class="img-rounded img-responsive" style="width: 60px; bordr-radius: 50%;"
                                     src="${pageContext.request.contextPath}${user.head_path}" alt="头像"></li>
        </ul>
           
        </div>
    </div>
</div>
</script>
</body>
</html>