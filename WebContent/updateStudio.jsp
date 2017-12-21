<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.StudioMODEL" %>
<%@ page import="java.util.ArrayList" %>
<% 
   String contextPath = request.getContextPath(); 
   request.setAttribute("contextPath", contextPath);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Studio</title>
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.min.css">
</head>
<body style="background-image: url(./image/background.jpg); background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;">
<%@ include file="./head.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="./studio.jsp">Studio</a></li>
                <li class="disabled"><a href="#">Play</a></li>
                <li class="disabled"><a href="#">Schedule</a></li>
                <li><a href="./user.jsp">User</a></li>
                <li ><a href="./employee.jsp">Employee</a></li>
                <li><a href="./seat.jsp">Seat</a></li>
            </ul>
        </div>
        <div class="col-sm-9">
          <form class="form-horizontal" role="form" action="StudioServlet?method=update" method="post">
                <input type="hidden" name="studio_id" value="${studio.studio_id}">
                <div class="form-group">
                    <label for="studio_name" class="col-sm-2 control-label">影厅名称</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="studio_name" name="studio_name" 
                            pattern="^[0-9][\u4e00-\u9fa5]{2,4}$"
                            required="required" oninvalid="setCustomValidity('请输入影厅,3-5字!')"
                            oninput="setCustomValidity('')" value="${studio.studio_name }">
                    </div>
                </div>
                <div class="form-group">
                    <label for="studio_row_count" class="col-sm-2 control-label">影厅行数</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="studio_row_count" name="studio_row_count" 
                            pattern="[0-9]{1,2}" 
                            required="required" oninvalid="setCustomValidity('请输入正确座位行数!')"
                            oninput="setCustomValidity('')" value="${studio.studio_row_count }">
                    </div>
                </div>
                <div class="form-group">
                    <label for="studio_col_count" class="col-sm-2 control-label">影厅列数</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="studio_col_count" name="studio_col_count" 
                            pattern="[0-9]{1,2}" 
                            required="required" oninvalid="setCustomValidity('请输入正确座位列数!')"
                            oninput="setCustomValidity('')" value="${studio.studio_col_count }">
                    </div>
                </div>
                <div class="form-group">
                    <label for="studio_introduction" class="col-sm-2 control-label">影厅描述</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="studio_introduction" name="studio_introduction"
                            required="required"  
                            oninput="setCustomValidity('')" value="${studio.studio_introduction }">
                    </div>
                </div>
                <div class="form-group">
                    <label for="studio_flag" class="col-sm-2 control-label">是否生成座位</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="studio_flag" name="studio_flag"
                            required="required"  pattern="^[01]$" 
                            required="required" oninvalid="setCustomValidity('请输入正确格式!')"
                            oninput="setCustomValidity('')" value="${studio.studio_flag }">
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