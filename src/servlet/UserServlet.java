package servlet;

import idao.DAOFactory;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmployeeMODEL;
import model.UserMODEL;
import dao.EmployeeDAO;
import dao.UserDAO;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String method = request.getParameter("method");
        if(method.equalsIgnoreCase("add"))
            add(request, response);
        else
            if(method.equalsIgnoreCase("delete"))
                delete(request, response);
            else
                if(method.equalsIgnoreCase("update"))
                    update(request, response);
                else
                    if(method.equalsIgnoreCase("searchByNO"))
                        search(request, response);
                    else
                        if(method.equalsIgnoreCase("searchByType"))
                            searchByType(request, response);
                        else
                            if(method.equalsIgnoreCase("searchByPage_user"))
                                searchByPage_user(request, response);
                            else
                                if(method.equalsIgnoreCase("searchByPage"))
                                    searchByPage(request, response);

    }

    private void add(HttpServletRequest request, HttpServletResponse response)
    {
        String emp_no = request.getParameter("emp_no");
        UserDAO dao = (UserDAO) DAOFactory.creatUserDAO();
        boolean result = dao.insert(emp_no);
        try
        {
            if(result)
            {
                request.setAttribute("result", "添加成功!");
                request.getRequestDispatcher("user.jsp").forward(request, response);
            }
            else
            {
                request.setAttribute("result", "添加失败!");
                request.getRequestDispatcher("addUser.jsp").forward(request, response);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
    {
        boolean result = false;
        String emp_no = request.getParameter("emp_no");

        UserDAO dao = (UserDAO) DAOFactory.creatUserDAO();
        result = dao.delete(emp_no);
        try
        {
            if(result)
            {
                request.setAttribute("result", "删除成功!");
                request.getRequestDispatcher("user.jsp").forward(request, response);

            }
            else
                request.setAttribute("result", "删除失败!");
            // 不分页时删除调用全查
            // search(request, response);
            // 分页时删除调用分页全查:使用分页index1.jsp时，把这里注释打开
            searchByPage(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

    }

    private void update(HttpServletRequest request, HttpServletResponse response)
    {

        String emp_no = request.getParameter("emp_no");
        String emp_pass = request.getParameter("emp_pass");
        int type = Integer.parseInt(request.getParameter("type"));
        String head_path = "/image/2.jpg";
        UserMODEL user = new UserMODEL();
        user.setEmp_no(emp_no);
        user.setEmp_pass(emp_pass);
        user.setType(type);
        user.setHead_path(head_path);

        UserDAO dao = (UserDAO) DAOFactory.creatUserDAO();
        boolean result = dao.update(user);
        try
        {
            if(result)
                request.setAttribute("result", "更新成功!");
            else
                request.setAttribute("result", "更新失败!");
            request.setAttribute("user", user);
            request.getRequestDispatcher("updateUser.jsp").forward(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response)
    {
        String emp_no = request.getParameter("emp_no");
        UserDAO dao = (UserDAO) DAOFactory.creatUserDAO();
        UserMODEL user = dao.findUserByNO(emp_no);
        // System.out.print(user.getType());
        request.setAttribute("user", user);
        try
        {
            request.getRequestDispatcher("updateUser.jsp").forward(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    private void searchByType(HttpServletRequest request, HttpServletResponse response)
    {
        /*
         * int emp_id = Integer.parseInt(request.getParameter("emp_id")); if(emp_id > 0) {
         * EmployeeDAO dao = (EmployeeDAO) DAOFactory.creatEmployeeDAO(); EmployeeMODEL emp =
         * dao.findEmployeeById(emp_id); request.setAttribute("employee", emp); try {
         * request.getRequestDispatcher("updateEmployee.jsp").forward(request, response); }
         * catch(Exception e) { e.printStackTrace(); } }
         */
    }

    private void searchByPage(HttpServletRequest request, HttpServletResponse response)
    {
        int currentPage = 1; // 当前页默认为第一页
        String strpage = request.getParameter("currentPage"); // 获取前台传入当前页
        if(strpage != null && !strpage.equals(""))
        {
            currentPage = Integer.parseInt(strpage) < 1 ? 1 : Integer.parseInt(strpage); // 将字符串转换成整型
        }
        String emp_no = request.getParameter("emp_no");
        UserDAO dao = (UserDAO) DAOFactory.creatUserDAO();
        // 从UserDAO中获取所有用户信息
        ArrayList<UserMODEL> list = dao.findUSerByPage(currentPage, emp_no);
        // 从UserDAO中获取总记录数
        int allCount = dao.getAllCount();
        // 从UserDAO中获取总页数
        int allPageCount = dao.getAllPageCount();
        // 从UserDAO中获取当前页
        currentPage = dao.getCurrentPage();

        // 存入request中
        request.setAttribute("allUser", list);
        request.setAttribute("allCount", allCount);
        request.setAttribute("allPageCount", allPageCount);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("search_emp_no", emp_no);

        try
        {
            request.getRequestDispatcher("user.jsp").forward(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    private void searchByPage_user(HttpServletRequest request, HttpServletResponse response)
    {
        int currentPage = 1; // 当前页默认为第一页
        String strpage = request.getParameter("currentPage"); // 获取前台传入当前页
        if(strpage != null && !strpage.equals(""))
        {
            currentPage = Integer.parseInt(strpage) < 1 ? 1 : Integer.parseInt(strpage); // 将字符串转换成整型
        }
        String emp_name = request.getParameter("emp_name");
        EmployeeDAO dao = (EmployeeDAO) DAOFactory.creatEmployeeDAO();
        // 从UserDAO中获取所有用户信息
        ArrayList<EmployeeMODEL> list = dao.findEmployeeByPage(currentPage, emp_name);
        // 从UserDAO中获取总记录数
        int allCount = dao.getAllCount();
        // 从UserDAO中获取总页数
        int allPageCount = dao.getAllPageCount();
        // 从UserDAO中获取当前页
        currentPage = dao.getCurrentPage();

        // 存入request中
        request.setAttribute("allEmployee", list);
        request.setAttribute("allCount", allCount);
        request.setAttribute("allPageCount", allPageCount);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("search_emp_name", emp_name);

        try
        {
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
