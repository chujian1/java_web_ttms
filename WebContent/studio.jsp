<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Studio</title>
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
                <li class="active"><a href="#">Studio</a></li>
                <li class="disabled"><a href="#">Play</a></li>
                <li class="disabled"><a href="#">Schedule</a></li>
                <li class="disabled"><a href="#">User</a></li>
                <li><a href="./employee.jsp">Employee</a></li>
                <li><a href="./seat.jsp">Seat</a></li>
            </ul>
        </div>
        <div class="col-sm-9">
            <div class="form-inline">
                <div class="row">
                    <div class="col-sm-offset-3 col-sm-4">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Stdio Name...">
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
                    <th>Name</th>
                    <th>Status</th>
                    <th>Level</th>
                    <th>Rows</th>
                    <th>Cels</th>
                    <th>delete</th>
                    <th>edit</th>
                </tr>
                </thead>
                <tbody id="listTable">
                <tr>
                    <td>1号厅</td>
                    <td>空闲</td>
                    <td>VIP</td>
                    <td>6</td>
                    <td>8</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>2号厅</td>
                    <td>使用</td>
                    <td>2D</td>
                    <td>10</td>
                    <td>12</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>3号厅</td>
                    <td>维修</td>
                    <td>3D</td>
                    <td>8</td>
                    <td>10</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>4号厅</td>
                    <td>空闲</td>
                    <td>3D</td>
                    <td>8</td>
                    <td>10</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>5号厅</td>
                    <td>使用</td>
                    <td>VIP</td>
                    <td>6</td>
                    <td>8</td>
                    <td><button type="button" class="btn btn-info btn-sm" onclick="del(this)"><span class="glyphicon glyphicon-remove"></span></button></td>
                    <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" onclick="edit(this)"><span class="glyphicon glyphicon-edit"></span></button></td>
                </tr>
                <tr>
                    <td>6号厅</td>
                    <td>维修</td>
                    <td>2D</td>
                    <td>10</td>
                    <td>12</td>
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
                        <label for="name" class="col-sm-offset-2 col-sm-2 control-label">Name</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="name" placeholder="input： x号厅">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-offset-2 col-sm-2 control-label">Status</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="status" placeholder="input： 空闲 使用 维修">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="level" class="col-sm-offset-2 col-sm-2 control-label">Level</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="level" placeholder="input： VIP 2D 3D">
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
<script type="text/javascript" src="./js/studio.js"></script>
<script src="./bootstrap/js/jquery.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>