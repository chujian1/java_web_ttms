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
<body style="background-image: url(./image/background.jpg); background-repeat: no-repeat;
    background-position: center center;
    background-size: cover;">
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
        <div class="search" >
            <form class="form-inline" name="myForm" action="EmployeeServlet?method=searchByPage" method="post">
                <!-- <input type="hidden" name="method" value="search"/> -->
                <input type="text" class="form-control" name="emp_name" value="${search_emp_name}"/>
                <input type="submit" class="btn btn-primary" value="查   询" />&nbsp;&nbsp;
                <input type="button" class="btn btn-danger" value="增   加" onclick="javascript:window.location='addEmployee.jsp'"/>
            </form>
        </div>
            <table class="table table-bordered table-hover" style="text-align:center;">
                <tr>
                    <th>用户id</th>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>电话</th>
                    <th>地址</th>
                    <th>邮箱</th>
                    <th colspan=2>操作</th>
                </tr>
                <%
                int currentPage=1;  //当前页
                int allCount=0;     //总记录数
                int allPageCount=0; //总页数
                EmployeeMODEL Employee=null;
                //查看request中是否有currentPage信息，如没有，则说明首次访问该页
                if(request.getAttribute("allEmployee")!=null)
                {
                    //获取Action返回的信息
                    currentPage=((Integer)request.getAttribute("currentPage")).intValue();
                    ArrayList<EmployeeMODEL> list=(ArrayList<EmployeeMODEL>)request.getAttribute("allEmployee");
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
                    <th><%=list.get(i).getEmp_id()%></th>
                    <th><%=list.get(i).getEmp_no()%></th>
                    <th><%=list.get(i).getEmp_name()%></th>
                    <th><%=list.get(i).getEmp_tel_num()%></th>
                    <th><%=list.get(i).getEmp_addr()%></th>
                    <th><%=list.get(i).getEmp_email()%></th>
                    <th><a href="EmployeeServlet?method=searchById&emp_id=<%=list.get(i).getEmp_id()%>">修改</a></th>
                    <th><a href="EmployeeServlet?method=delete&emp_id=<%=list.get(i).getEmp_id()%>&emp_name=${search_emp_name}&currentPage=${currentPage}">删除</a></th>
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
                <li><a href="EmployeeServlet?method=searchByPage&currentPage=1&emp_name=${search_emp_name}">首页</a></li>
                <li><a href="EmployeeServlet?method=searchByPage&currentPage=<%=(currentPage-1)<1?1:(currentPage-1)%>&emp_name=${search_emp_name}">上一页</a></li>
                <li><a href="EmployeeServlet?method=searchByPage&currentPage=<%=(currentPage+1)>allPageCount?allPageCount:(currentPage+1)%>&emp_name=${search_emp_name}">下一页</a></li>
                <li><a href="EmployeeServlet?method=searchByPage&currentPage=<%=allPageCount%>&emp_name=${search_emp_name}">末页</a></li>
              </ul>
            </nav>
        </div>
    </div>
</div>

<script type="text/javascript" src="./js/employee.js"></script>
<script src="./bootstrap/js/jquery.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
</body>
</html>