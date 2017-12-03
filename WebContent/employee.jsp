<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee</title>
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.min.css">
</head>
<body style="background-image: url(./image/body.jpg)">
<div class="page-header">
    <div class="row">
        <div class="col-md-9">
            <h1 style="text-align: center">初见TTMS</h1>
        </div>
        <div class="col-md-3">
            <span class="glyphicon glyphicon-user"></span>
            <a href="#">管理员 |</a>
            <a href="#">退出</a>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="./studio.jsp">Studio</a></li>
                <li class="disabled"><a href="#">Play</a></li>
                <li class="disabled"><a href="#">Schedule</a></li>
                <li class="disabled"><a href="#">User</a></li>
                <li class="active"><a href="#">Employee</a></li>
                <li><a href="./seat.jsp">Seat</a></li>
            </ul>
        </div>
        <div class="col-sm-9">
            <div class="form-inline">
                <div class="row">
                    <div class="col-sm-offset-3 col-sm-4">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Employee Name...">
                            <span class="input-group-btn">
                            <button class="btn btn-default">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                        </div>
                    </div>
                    <div class="col-sm-1">
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span></button>
                    </div>
                </div>
            </div>
            <table class="table table-hover" id="myTable">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>联系方式</th>
                    <th>地址</th>
                    <th>邮件</th>
                    <th>delete</th>
                    <th>edit</th>
                </tr>
                </thead>
                <tbody id="listTable">
                <tr>
                    <td>0001</td>
                    <td>张三</td>
                    <td>13311111111</td>
                    <td>长安南路</td>
                    <td>111@163.com</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>0002</td>
                    <td>李四</td>
                    <td>13322222222</td>
                    <td>莲湖路</td>
                    <td>222@163.com</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>0003</td>
                    <td>王五</td>
                    <td>13333333333</td>
                    <td>东五路</td>
                    <td>333@163.com</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>0004</td>
                    <td>马六</td>
                    <td>13344444444</td>
                    <td>西一路</td>
                    <td>444@163.com</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>0005</td>
                    <td>郑七</td>
                    <td>13355555555</td>
                    <td>南稍门</td>
                    <td>555@163.com</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>0006</td>
                    <td>刘八</td>
                    <td>13366666666</td>
                    <td>大溪地</td>
                    <td>666@163.com</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>

</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Studio</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="num" class="col-sm-offset-2 col-sm-2 control-label">编号</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="num" placeholder="input： 编号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-offset-2 col-sm-2 control-label">姓名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name" placeholder="input： 姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tel" class="col-sm-offset-2 col-sm-2 control-label">联系方式</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="tel" placeholder="input： 电话号码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="addr" class="col-sm-offset-2 col-sm-2 control-label">地址</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="addr" placeholder="input： 地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-offset-2 col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="email" placeholder="input： 邮箱">
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="add()">Add</button>
                <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="update()">Commit</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript" src="./js/employee.js"></script>
<script src="./bootstrap/js/jquery.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>