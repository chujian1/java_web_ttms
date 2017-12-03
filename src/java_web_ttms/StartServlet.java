package java_web_ttms;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class StartServlet extends HttpServlet
{
    @Override
    public void init() throws ServletException
    {
        super.init();
        System.out.println("-------------->Servlet自动启动了，可以进行一些初始化操作......");
    }
}
