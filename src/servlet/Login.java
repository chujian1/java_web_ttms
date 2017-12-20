package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserMODEL;
import service.UserSrv;

@WebServlet("/Login")
public class Login extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        // TODO:一个账号登陆后，另一个账户登录，会访问前一个账户的内容，所以登陆后需要清除原session
        request.getSession().setAttribute("login", null);
        request.getSession().setAttribute("admin", null);
        request.getSession().setAttribute("user", null);
        request.getSession().invalidate();
        String name = request.getParameter("user");
        String pass = request.getParameter("pass");
        String result = "用户名、密码错误!";
        String page = "login.jsp";
        UserSrv userSrv = new UserSrv();
        UserMODEL user = userSrv.findUserByNo(name).get(0);
        if(name == null || pass == null)
        {
            result = "用户名或密码不能为空";
            request.setAttribute("desc", result);
        }
        else
            if(user.getType() == 1 && user.getEmp_no().equals(name)
                    && user.getEmp_pass().equals(pass))
            {
                request.setAttribute("name", name);
                request.getSession().setAttribute("login", "ok");
                request.getSession().setAttribute("admin", "ok");
                page = "employee.jsp";
            }
            else
                if(user.getType() == 0 && user.getEmp_no().equals(name)
                        && user.getEmp_pass().equals(pass))
                {
                    request.setAttribute("name", name);
                    request.getSession().setAttribute("login", "ok");
                    request.getSession().setAttribute("user", "ok");
                    page = "studio.jsp";
                }
                else
                {
                    request.setAttribute("desc", result);
                }
        request.getRequestDispatcher(page).forward(request, response);
    }

}