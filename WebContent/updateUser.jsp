<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.UserMODEL" %>
<%@ page import="java.util.ArrayList" %>
<% 
   String contextPath = request.getContextPath(); 
   request.setAttribute("contextPath", contextPath);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User</title>
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
                <li class="active"><a href="./user.jsp">User</a></li>
                <li><a href="./employee.jsp">Employee</a></li>
                <li><a href="./seat.jsp">Seat</a></li>
            </ul>
        </div>
        <div class="col-sm-9">
        
          <form class="form-horizontal" role="form" action="UserServlet?method=update" method="post">
                <div class="form-group">
                    <label for="emp_no" class="col-sm-2 control-label">用户编号</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="emp_no" name="emp_no" pattern="[a-zA-Z0-9]{6,20}" 
                            required="required" oninvalid="setCustomValidity('请输入大小写字母和数字,长度6-20位!')" 
                            oninput="setCustomValidity('')" value="${user.emp_no}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="emp_pass" class="col-sm-2 control-label">用户密码</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="emp_pass" name="emp_pass" pattern="[0-9]{6}"
                            required="required" oninvalid="setCustomValidity('请输入有效密码!')"
                            oninput="setCustomValidity('')"  value="${user.emp_pass}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="type" class="col-sm-2 control-label">用户类型</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="type" name="type" pattern="[0-1]{1}" 
                            required="required" oninvalid="setCustomValidity('请输入0或1!')"
                            oninput="setCustomValidity('')" value="${user.type}">
                    </div>
                </div>
                 <div class="form-group">
                            <label class="col-sm-2 control-label">头像</label>
                            <div class="col-sm-6">
                                <img class="img-rounded img-responsive" style="width: 22%"
                                     src="${pageContext.request.contextPath}${user.head_path}" alt="头像"><br>
                                     <a class="btn btn-primary" >
                                <input unselectable="on" type="file" style="position: absolute;display: block!important;width: 82px;opacity: 0;" name="part">
                                更改头像
                            </a>
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

<script type="text/javascript" src="./js/user.js"></script>
<script src="./bootstrap/js/jquery.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>