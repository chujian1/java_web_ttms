package servlet;

import idao.DAOFactory;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StudioMODEL;
import dao.StudioDAO;

@WebServlet("/StudioServlet")
public class StudioServlet extends HttpServlet
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
                    if(method.equalsIgnoreCase("search"))
                        search(request, response);
                    else
                        if(method.equalsIgnoreCase("searchById"))
                            searchById(request, response);
                        else
                            if(method.equalsIgnoreCase("searchByPage"))
                                searchByPage(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response)
    {
        String studio_name = request.getParameter("studio_name");
        int studio_row_count = Integer.parseInt(request.getParameter("studio_row_count"));
        int studio_col_count = Integer.parseInt(request.getParameter("studio_col_count"));
        String studio_introduction = request.getParameter("studio_introduction");
        int studio_flag = Integer.parseInt(request.getParameter("studio_flag"));
        StudioMODEL studio = new StudioMODEL();
        studio.setStudio_name(studio_name);
        studio.setStudio_row_count(studio_row_count);
        studio.setStudio_col_count(studio_col_count);
        studio.setStudio_introduction(studio_introduction);
        studio.setStudio_flag(studio_flag);
        StudioDAO dao = (StudioDAO) DAOFactory.creatStudioDAO();
        boolean result = dao.insert(studio);
        try
        {
            if(result)
                request.setAttribute("result", "添加成功!");
            else
                request.setAttribute("result", "添加失败!");
            request.getRequestDispatcher("addStudio.jsp").forward(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
    {
        boolean result = false;
        int studio_id = Integer.parseInt(request.getParameter("studio_id"));
        if(studio_id > 0)
        {
            StudioDAO dao = (StudioDAO) DAOFactory.creatStudioDAO();
            result = dao.delete(studio_id);
            if(result)
                request.setAttribute("result", "删除成功!");
            else
                request.setAttribute("result", "删除失败!");
            // 不分页时删除调用全查
            // search(request, response);
            // 分页时删除调用分页全查:使用分页index.jsp时，把这里注释打开
            searchByPage(request, response);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
    {
        int studio_id = Integer.parseInt(request.getParameter("studio_id"));
        String studio_name = request.getParameter("studio_name");
        int studio_row_count = Integer.parseInt(request.getParameter("studio_row_count"));
        int studio_col_count = Integer.parseInt(request.getParameter("studio_col_count"));
        String studio_introduction = request.getParameter("studio_introduction");
        int studio_flag = Integer.parseInt(request.getParameter("studio_flag"));
        StudioMODEL studio = new StudioMODEL();
        studio.setStudio_id(studio_id);
        studio.setStudio_name(studio_name);
        studio.setStudio_row_count(studio_row_count);
        studio.setStudio_col_count(studio_col_count);
        studio.setStudio_introduction(studio_introduction);
        studio.setStudio_flag(studio_flag);
        StudioDAO dao = (StudioDAO) DAOFactory.creatStudioDAO();
        boolean result = dao.update(studio);
        try
        {
            if(result)
                request.setAttribute("result", "更新成功!");
            else
                request.setAttribute("result", "更新失败!");
            request.setAttribute("studio", studio);
            request.getRequestDispatcher("updateStudio.jsp").forward(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response)
    {
        String studio_name = request.getParameter("studio_name");
        StudioDAO dao = (StudioDAO) DAOFactory.creatStudioDAO();
        ArrayList<StudioMODEL> list = null;
        if(studio_name == null || studio_name.equals(""))
            list = dao.findStudioAll();
        else
            list = dao.findStudioByName(studio_name);
        try
        {
            request.setAttribute("search_studio_name", studio_name);
            request.setAttribute("list", list);
            request.getRequestDispatcher("studio.jsp").forward(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    private void searchById(HttpServletRequest request, HttpServletResponse response)
    {
        int studio_id = Integer.parseInt(request.getParameter("studio_id"));
        if(studio_id > 0)
        {
            StudioDAO dao = (StudioDAO) DAOFactory.creatStudioDAO();
            StudioMODEL studio = dao.findStudioById(studio_id);
            request.setAttribute("studio", studio);
            try
            {
                request.getRequestDispatcher("updateStudio.jsp").forward(request, response);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }

    private void searchByPage(HttpServletRequest request, HttpServletResponse response)
    {
        int currentPage = 1; // 当前页默认为第一页
        String strpage = request.getParameter("currentPage"); // 获取前台传入当前页
        if(strpage != null && !strpage.equals(""))
        {
            currentPage = Integer.parseInt(strpage) < 1 ? 1 : Integer.parseInt(strpage); // 将字符串转换成整型
        }
        String studio_name = request.getParameter("studio_name");
        StudioDAO dao = (StudioDAO) DAOFactory.creatStudioDAO();
        // 从UserDAO中获取所有用户信息
        ArrayList<StudioMODEL> list = dao.findStudioByPage(currentPage, studio_name);
        // 从UserDAO中获取总记录数
        int allCount = dao.getAllCount();
        // 从UserDAO中获取总页数
        int allPageCount = dao.getAllPageCount();
        // 从UserDAO中获取当前页
        currentPage = dao.getCurrentPage();

        // 存入request中
        request.setAttribute("allStudio", list);
        request.setAttribute("allCount", allCount);
        request.setAttribute("allPageCount", allPageCount);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("search_studio_name", studio_name);

        try
        {
            request.getRequestDispatcher("studio.jsp").forward(request, response);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
