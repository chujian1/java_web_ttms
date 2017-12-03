package java_web_ttms;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 可以不用配置web.xml,在Servlet中通过注解设置Servlet
// @WebServlet(urlPatterns = "/Login")
public class Login extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        // 设置jsp页面编码
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");

        System.out.println(user);
        System.out.println(pass);

        // 用户名密码正确，转发到result.jsp
        if(user != null && user.equals("aaa") && pass != null && pass.equals("aaa"))
        {
            // 转发携带原request封装的数据
            request.getSession().setAttribute("loginflag", "登陆成功");
            request.setAttribute("user", user);
            request.setAttribute("pass", pass);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        }
        else
        {
            request.setAttribute("desc", "用户名、密码错误!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
