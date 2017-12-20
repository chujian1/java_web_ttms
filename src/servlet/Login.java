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

        request.getSession().invalidate();
        String name = request.getParameter("user");
        String pass = request.getParameter("pass");
        String result = "用户名、密码错误!";
        String page = "login.jsp";
        UserSrv userSrv = new UserSrv();
        UserMODEL user = userSrv.findUserByNoAndPass(name, pass);
        if(name == null || pass == null)
        {
            result = "用户名或密码不能为空";
            request.setAttribute("desc", result);
        }
        else
            if(user.getType() == 1)
            {
                request.getSession().setAttribute("name", name);
                request.getSession().setAttribute("login", "ok");
                request.getSession().setAttribute("admin", "ok");
                request.getSession().setAttribute("user", user);
                page = "employee.jsp";
            }
        if(user.getType() == 0)
        {
            request.getSession().setAttribute("name", name);
            request.getSession().setAttribute("login", "ok");
            request.getSession().setAttribute("user", "ok");
            request.getSession().setAttribute("user", user);
            page = "studio.jsp";
        }
        if(user == null)
        {
            request.setAttribute("desc", result);
        }

        request.getRequestDispatcher(page).forward(request, response);
    }

}