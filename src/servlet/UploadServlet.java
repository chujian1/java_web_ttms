package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

// @WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet
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
        // 实例化上载bean
        SmartUpload mySmartUpload = new SmartUpload();
        // PageContext是jsp的内置对象，在servlet不能直接使用，需要做一些处理
        JspFactory _jspxFactory = JspFactory.getDefaultFactory();
        PageContext pageContext = _jspxFactory.getPageContext(this, request, response, "", true,
                                                              8192, true);
        // 初始化
        mySmartUpload.initialize(pageContext);
        // 设置上载的最大值,注意:如果这里设置过大会出现问题!
        mySmartUpload.setMaxFileSize(10 * 1024 * 1024);
        // 上载文件
        try
        {
            mySmartUpload.upload();
            // mySmartUpload.save("d:\\jsp\\"); // TODO:只能原名保存，不能改名
        }
        catch(SmartUploadException e)
        {
            e.printStackTrace();
        }

        // 取得上载的文件
        com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
        if(!myFile.isMissing())
        {
            // 取得别的参数
            String play_type = (String) mySmartUpload.getRequest().getParameter("play_type");
            String play_lang = (String) mySmartUpload.getRequest().getParameter("play_lang");
            String play_name = (String) mySmartUpload.getRequest().getParameter("play_name");
            String play_introduction = (String) mySmartUpload.getRequest()
                                                             .getParameter("play_introduction");
            String play_length = (String) mySmartUpload.getRequest().getParameter("play_length");
            String play_ticket_price = (String) mySmartUpload.getRequest()
                                                             .getParameter("play_ticket_price");

            // 取得上载的文件的文件名
            String myFileName = myFile.getFileName();
            // 取得不带后缀的文件名
            String suffix = myFileName.substring(0, myFileName.lastIndexOf('.'));
            // 取得后缀名
            String ext = myFile.getFileExt();
            // 取得文件的大小
            int fileSize = myFile.getSize();
            // 保存路径
            String aa = getServletContext().getRealPath("/") + "jsp\\";
            File aadir = new File(aa);
            if(!aadir.exists())
                aadir.mkdirs();
            String trace = aa + myFileName;
            System.out.println(trace);
            // 将文件保存在服务器端(使用全路径)
            try
            {
                myFile.saveAs(trace, mySmartUpload.SAVE_PHYSICAL);
            }
            catch(SmartUploadException e)
            {
                e.printStackTrace();
            }

            // 将上传参数及文件路径存入vo类
            /*
             * Play play = new Play(); play.setPlayName(play_name); play.setPlayType(play_type);
             * play.setPlayLang(play_lang); play.setPlayIntroduction(play_introduction);
             * play.setPlayLength(Integer.parseInt(play_length));
             * play.setPlayTicketPrice(Float.parseFloat(play_ticket_price)); // 只传递相对路径
             * play.setPlayImage("jsp\\" + myFileName); request.setAttribute("play", play);
             */
            // 带着play对象转发到result.java页
            request.getRequestDispatcher("result.jsp").forward(request, response);

        }
    }

}
