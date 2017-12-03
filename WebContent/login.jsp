<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="false" errorPage="error.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.min.css">
</head>
<body style="background-image: url(./image/body.jpg)">
    <div class="page-header" >
        <h1 style="text-align:center;">初见TTMS</h1>
    </div>
    <div class="container-fluid" style="border:solid black ;width:25%;margin-top:70px;">
        <form action="Login" method="post" name="form" class="form-horizontal" style="padding:20px;">
            <div class="form-group">
                <label type="text" for="inputUser" class="col-sm-2 control-label">User</label>
                <div class="col-sm-offset-1 col-sm-8">
                    <input type="text" class="form-control" name="user" id="inputUser" placeholder="User" required autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-offset-1 col-sm-8">
                    <input type="password" name="pass" class="form-control" id="inputPassword" placeholder="Password" required>
                </div>
            </div>
            <div class="text-center" >
                <button type="submit" value="提交" class="btn btn-primary ">Sign in</button>
            </div>
        </form>
    </div>
    ${desc}
<script type="text/javascript" src="./js/login.js"></script>
<script src="./bootstrap/js/jquery.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>