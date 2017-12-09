package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Studio")
public class Studio extends HttpServlet
{
    private static final long serialVersionUID = 1990759197028111530L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        // 指定返回xml类型
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml;charset=UTF-8");
        String province = request.getParameter("province");
        System.out.println(province);
        StringBuffer sb = new StringBuffer("<province>");
        if("陕西".equals(province))
        {
            sb.append("<city>西安</city><city>铜川</city><city>宝鸡</city><city>咸阳</city>");
        }
        else
            if("山东".equals(province))
            {
                sb.append("<city>济南</city><city>青岛</city><city>淄博</city><city>烟台</city>");
            }
        sb.append("</province>");
        PrintWriter out = response.getWriter();
        System.out.println(sb.toString());
        out.write(sb.toString());
        out.close();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doPost(request, response);
    }
}
