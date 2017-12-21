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
<link rel="stylesheet" href="./css/index.css">
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
                <li class="active"><a href="#">Studio</a></li>
                <li class="disabled"><a href="#">Play</a></li>
                <li class="disabled"><a href="#">Schedule</a></li>
                <li><a href="./user.jsp">User</a></li>
                <li><a href="./employee.jsp">Employee</a></li>
                <li><a href="./seat.jsp">Seat</a></li>
            </ul>
        </div>
        <div class="col-sm-9">
        <div class="search" >
            <form class="form-inline" name="myForm" action="StudioServlet?method=searchByPage" method="post">
                <!-- <input type="hidden" name="method" value="search"/> -->
                <input type="text" class="form-control" name="studio_name" value="${search_studio_name}"/>
                <input type="submit" class="btn btn-primary" value="查   询" />&nbsp;&nbsp;
                <input type="button" class="btn btn-danger" value="增   加" onclick="javascript:window.location='addStudio.jsp'"/>
            </form>
        </div>
            <table class="table table-bordered table-hover" style="text-align:center;">
                <tr>
                    <th>名称</th>
                    <th>行数</th>
                    <th>列数</th>
                    <th>介绍</th>
                    <th>是否生成座位</th>
                    <th colspan=2>操作</th>
                </tr>
                <%
                int currentPage=1;  //当前页
                int allCount=0;     //总记录数
                int allPageCount=0; //总页数
                StudioMODEL Studio=null;
                //查看request中是否有currentPage信息，如没有，则说明首次访问该页
                if(request.getAttribute("allStudio")!=null)
                {
                    //获取Action返回的信息
                    currentPage=((Integer)request.getAttribute("currentPage")).intValue();
                    ArrayList<StudioMODEL> list=(ArrayList<StudioMODEL>)request.getAttribute("allStudio");
                    allCount=((Integer)request.getAttribute("allCount")).intValue();
                    allPageCount=((Integer)request.getAttribute("allPageCount")).intValue();
                    if(list!=null && list.size()>0)
                    {
                        for(int i=0;i<list.size();i++)
                        {
                            if(i%2==0)
                                out.println("<tr class='success'>");
                            else
                                out.println("<tr class='active'>");
                %>
                    <th><%=list.get(i).getStudio_name()%></th>
                    <th><%=list.get(i).getStudio_row_count()%></th>
                    <th><%=list.get(i).getStudio_col_count()%></th>
                    <th><%=list.get(i).getStudio_introduction()%></th>
                    <th><%=list.get(i).getStudio_flag()%></th>
                    <th><a href="StudioServlet?method=searchById&studio_id=<%=list.get(i).getStudio_id()%>">修改</a></th>
                    <th><a href="StudioServlet?method=delete&studio_id=<%=list.get(i).getStudio_id()%>&studio_name=${search_studio_name}&currentPage=${currentPage}">删除</a></th>
                </tr>
                <%
                        }
                    }
                }
                %>
            </table>
        </div>
        
        <!-- 分页 -->
        <div class="text-center">
            <nav>
              <ul class="pagination">
                <li><a href="StudioServlet?method=searchByPage&currentPage=1&studio_name=${search_studio_name}">首页</a></li>
                <li><a href="StudioServlet?method=searchByPage&currentPage=<%=(currentPage-1)<1?1:(currentPage-1)%>&studio_name=${search_studio_name}">上一页</a></li>
                <li><a href="StudioServlet?method=searchByPage&currentPage=<%=(currentPage+1)>allPageCount?allPageCount:(currentPage+1)%>&studio_name=${search_studio_name}">下一页</a></li>
                <li><a href="StudioServlet?method=searchByPage&currentPage=<%=allPageCount%>&studio_name=${search_studio_name}">末页</a></li>
              </ul>
            </nav>
        </div>
    </div>
                
</div>
<script type="text/javascript" src="./js/studio.js"></script>
<script src="./bootstrap/js/jquery.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>