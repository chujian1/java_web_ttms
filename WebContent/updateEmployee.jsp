<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.EmployeeMODEL" %>
<%@ page import="java.util.ArrayList" %>
<% 
   String contextPath = request.getContextPath(); 
   request.setAttribute("contextPath", contextPath);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee</title>
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.min.css">
</head>
<body style="background-image: url(./image/body.jpg)">
<%@ include file="./head.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="./studio.jsp">Studio</a></li>
                <li class="disabled"><a href="#">Play</a></li>
                <li class="disabled"><a href="#">Schedule</a></li>
                <li><a href="./user.jsp">User</a></li>
                <li class="active"><a href="./employee.jsp">Employee</a></li>
                <li><a href="./seat.jsp">Seat</a></li>
            </ul>
        </div>
        <div class="col-sm-9">
          <form class="form-horizontal" role="form" action="EmployeeServlet?method=update" method="post">
                <input type="hidden" name="emp_id" value="${employee.emp_id}">
                <div class="form-group">
                    <label for="emp_no" class="col-sm-2 control-label">用户编号</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="emp_no" name="emp_no" pattern="[a-zA-Z0-9]{6,20}" 
                            required="required" oninvalid="setCustomValidity('请输入大小写字母和数字,长度6-20位!')" 
                            oninput="setCustomValidity('')" value="${employee.emp_no}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="emp_name" class="col-sm-2 control-label">用户姓名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="emp_name" name="emp_name" pattern="[\u4e00-\u9fa5]{2,10}"
                            required="required" oninvalid="setCustomValidity('请输入真实姓名,10字以内!')"
                            oninput="setCustomValidity('')"  value="${employee.emp_name}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="emp_tel_num" class="col-sm-2 control-label">电话号码</label>
                    <div class="col-sm-6">
                        <input type="tel" class="form-control" id="emp_tel_num" name="emp_tel_num" pattern="1[3-8][0-9]{9}" 
                            required="required" oninvalid="setCustomValidity('请输入正确手机号码!')"
                            oninput="setCustomValidity('')" value="${employee.emp_tel_num}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="emp_addr" class="col-sm-2 control-label">地址</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="emp_addr" name="emp_addr" pattern=".{2,30}" 
                            required="required" oninvalid="setCustomValidity('请输入地址!')"
                            oninput="setCustomValidity('')" value="${employee.emp_addr}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="emp_email" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="emp_email" name="emp_email"
                            required="required"  oninvalid="setCustomValidity('请输入正确格式Email!')"
                            pattern="([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-zA-Z0-9_-]{2,3}){1,2})"
                            oninput="setCustomValidity('')" value="${employee.emp_email}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-2 control-label" style="color:red;font-weight: bold;">${result}</div>
                    <div class="col-sm-6">
                        <!-- <input type="hidden" name="method" value="update"> -->
                        <button type="submit" class="btn btn-primary">修  改</button>                     
                    </div>
                </div>
            </form>

        </div>

</div>

<script type="text/javascript" src="./js/employee.js"></script>
<script src="./bootstrap/js/jquery.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>