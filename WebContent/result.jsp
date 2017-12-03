<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在此处插入标题</title>
</head>
<body>
<%
out.println("session值:" + session.getAttribute("loginflag"));
out.println("<br>");
out.println("request值:<br>");
out.println("用户名:" + request.getAttribute("user"));
out.println("<br>");
out.println("密码:" + request.getAttribute("pass"));
out.println("<br>");
%>
<%
out.println(request.getMethod() +"<br>");
//request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
out.println(name);
%>

<br>
EL表达式接收：<br>
session值: ${loginflag}<br>
request值:<br>
用户名: ${user}<br>
密码: ${pass}

</body>
</html>