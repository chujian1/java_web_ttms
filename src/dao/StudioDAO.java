package dao;

import idao.StudioIDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.StudioMODEL;
import mysql.ConnectionManager;

public class StudioDAO implements StudioIDAO
{

    public static final int PAGE_SIZE = 8; // 每页显示条数
    private int allCount; // 数据库中条数
    private int allPageCount; // 总页数
    private int currentPage; // 当前页

    public int getAllCount()
    {
        return allCount;
    }

    public int getAllPageCount()
    {
        return allPageCount;
    }

    public int getCurrentPage()
    {
        return currentPage;
    }

    @SuppressWarnings("finally")
    public ArrayList<StudioMODEL> findStudioByPage(int cPage, String studio_name)
    {
        currentPage = cPage;
        ArrayList<StudioMODEL> list = new ArrayList<StudioMODEL>();

        // 若未指定查找演出厅，则默认全查
        if(null == studio_name || studio_name.equals("null"))
        {
            studio_name = "";
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取记录总数
            String sql1 = "select count(studio_id) as AllRecord from studio where studio_name like ?";
            conn = ConnectionManager.getInstance().getConnection();
            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, "%" + studio_name + "%");
            rs = pstmt.executeQuery();
            if(rs.next())
                allCount = rs.getInt("AllRecord");
            rs.close();
            pstmt.close();

            // 记算总页数
            allPageCount = (allCount + PAGE_SIZE - 1) / PAGE_SIZE;

            // 如果当前页数大于总页数，则赋值为总页数
            if(allPageCount > 0 && currentPage > allPageCount)
                currentPage = allPageCount;

            // 获取第currentPage页数据
            String sql2 = "select * from studio where studio_name like ? limit ?,?";
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, "%" + studio_name + "%");
            pstmt.setInt(2, PAGE_SIZE * (currentPage - 1));
            pstmt.setInt(3, PAGE_SIZE);
            rs = pstmt.executeQuery();
            StudioMODEL studio = null;
            while(rs.next())
            {
                studio = new StudioMODEL();
                studio.setStudio_id(rs.getInt("studio_id"));
                studio.setStudio_name(rs.getString("studio_name"));
                studio.setStudio_row_count(rs.getInt("studio_row_count"));
                studio.setStudio_col_count(rs.getInt("studio_col_count"));
                studio.setStudio_introduction(rs.getString("studio_introduction"));
                studio.setStudio_flag(rs.getInt("studio_flag"));
                // 将该用户信息插入列表
                list.add(studio);
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        finally
        {
            ConnectionManager.close(rs, pstmt, conn);
            return list;
        }
    }

    @Override
    public boolean insert(StudioMODEL studio)
    {
        boolean result = false;
        if(studio == null)
            return result;

        // 获取Connection
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            String sql = "insert into studio(studio_name, studio_row_count, studio_col_count, studio_introduction,studio_flag) values(?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, studio.getStudio_name());
            pstmt.setInt(2, studio.getStudio_row_count());
            pstmt.setInt(3, studio.getStudio_col_count());
            pstmt.setString(4, studio.getStudio_introduction());
            pstmt.setInt(5, studio.getStudio_flag());

            pstmt.executeUpdate();
            result = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            // 关闭连接
            ConnectionManager.close(null, pstmt, con);
            return result;
        }
    }

    @Override
    public boolean delete(int studio_id)
    {
        boolean result = false;
        if(studio_id == 0)
            return result;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            // 删除子某个用户
            String sql = "delete from studio where studio_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, studio_id);
            pstmt.executeUpdate();
            ConnectionManager.close(null, pstmt, con);

            result = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            // 关闭连接
            ConnectionManager.close(null, pstmt, con);
            return result;
        }
    }

    @Override
    public boolean update(StudioMODEL studio)
    {
        boolean result = false;
        if(studio == null)
            return result;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            String sql = "update studio set studio_name=?,studio_row_count=?,studio_col_count=?,studio_introduction=?,studio_flag=? where studio_id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, studio.getStudio_name());
            pstmt.setInt(2, studio.getStudio_row_count());
            pstmt.setInt(3, studio.getStudio_col_count());
            pstmt.setString(4, studio.getStudio_introduction());
            pstmt.setInt(5, studio.getStudio_flag());
            pstmt.setInt(6, studio.getStudio_id());
            pstmt.executeUpdate();
            result = true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            // 关闭连接
            ConnectionManager.close(null, pstmt, con);
            return result;
        }
    }

    @Override
    public ArrayList<StudioMODEL> findStudioAll()
    {
        ArrayList<StudioMODEL> list = new ArrayList<StudioMODEL>();
        StudioMODEL studio = null;
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据
            pstmt = con.prepareStatement("select * from studio");
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                studio = new StudioMODEL();

                studio.setStudio_id(rs.getInt("studio_id"));
                studio.setStudio_name(rs.getString("studio_name"));
                studio.setStudio_row_count(rs.getInt("studio_row_count"));
                studio.setStudio_col_count(rs.getInt("studio_col_count"));
                studio.setStudio_introduction(rs.getString("studio_introduction"));
                studio.setStudio_flag(rs.getInt("studio_flag"));
                // 加入列表
                list.add(studio);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            ConnectionManager.close(rs, pstmt, con);
            return list;
        }
    }

    @Override
    public ArrayList<StudioMODEL> findStudioByName(String studioName)
    {
        if(studioName == null || studioName.equals(""))
            return null;

        ArrayList<StudioMODEL> list = new ArrayList<StudioMODEL>();
        StudioMODEL studio = null;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据:模糊查询
            pstmt = con.prepareStatement("select * from studio where studio_name like ?");
            pstmt.setString(1, "%" + studioName + "%");// 拼接模糊查询串
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                studio = new StudioMODEL();

                studio.setStudio_id(rs.getInt("studio_id"));
                studio.setStudio_name(rs.getString("studio_name"));
                studio.setStudio_row_count(rs.getInt("studio_row_count"));
                studio.setStudio_col_count(rs.getInt("studio_col_count"));
                studio.setStudio_introduction(rs.getString("studio_introduction"));
                studio.setStudio_flag(rs.getInt("studio_flag"));
                // 加入列表
                list.add(studio);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            ConnectionManager.close(rs, pstmt, con);
            return list;
        }
    }

    @Override
    public StudioMODEL findStudioById(int studio_id)
    {
        StudioMODEL studio = null;
        if(studio_id == 0)
            return studio;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据
            pstmt = con.prepareStatement("select * from studio where studio_id=?");
            pstmt.setInt(1, studio_id);
            rs = pstmt.executeQuery();
            if(rs.next())
            {
                studio = new StudioMODEL();

                studio.setStudio_id(rs.getInt("studio_id"));
                studio.setStudio_name(rs.getString("studio_name"));
                studio.setStudio_row_count(rs.getInt("studio_row_count"));
                studio.setStudio_col_count(rs.getInt("studio_col_count"));
                studio.setStudio_introduction(rs.getString("studio_introduction"));
                studio.setStudio_flag(rs.getInt("studio_flag"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            ConnectionManager.close(rs, pstmt, con);
            return studio;
        }
    }

}
