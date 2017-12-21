<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seat</title>
<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="./bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./css/seat.css">
</head>

<body style="background-image: url(./image/background.jpg); background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;"">
<%@ include file="./head.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="./studio.jsp">Studio</a></li>
                <li class="disabled"><a href="#">Play</a></li>
                <li class="disabled"><a href="#">Schedule</a></li>
                <li><a href="./user.jsp">User</a></li>
                <li><a href="./employee.jsp">Employee</a></li>
                <li><a href="#">Seat</a></li>
                <li class="active"><a href="#">1号厅</a></li>
                <li><a href="#">2号厅</a></li>
                <li><a href="#">3号厅</a></li>
                <li><a href="#">4号厅</a></li>
            </ul>
        </div>
        <div class="col-sm-9">
                <div id="seat-map">
                    <div class="front">屏幕</div>
                </div>

                <div class="booking-details">
                    <p>影片：<span>星际穿越</span></p>
                    <p>时间：<span>11月14日 21:00</span></p>
                    <p>座位：</p>
                    <ul id="selected-seats"></ul>
                    <p>票数：<span id="counter">0</span></p>
                    <p>总计：<b>￥<span id="total">0</span></b></p>

                    <button class="checkout-button">确定购买</button>

                    <div id="legend"></div>
                </div>
                <div style="clear:both"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="./bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="./bootstrap/js/jquery.seat-charts.min.js"></script>
<script type="text/javascript" src="./js/seat.js"></script>


</body>
</html>