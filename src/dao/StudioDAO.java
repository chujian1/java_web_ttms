package dao;

import idao.StudioIDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.StudioMODEL;
import mysql.ConnectionManager;

public class StudioDAO implements StudioIDAO
{
    @Override
    public boolean insert(StudioMODEL studio)
    {
        boolean result = false;
        if(studio == null)
        {
            return result;
        }
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            String sql = "insert into Studio(studio_name, studio_row_count, studio_col_count, studio_introduction, studio_flag) values(?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, studio.getStudio_name());
            pstmt.setInt(2, studio.getStudio_row_count());
            pstmt.setInt(3, studio.getStudio_col_count());
            pstmt.setString(4, studio.getStudio_introduction());
            pstmt.setInt(5, studio.getStudio_flag());
            pstmt.executeLargeUpdate();
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
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {

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
            String sql = "update studio set studio_name=?,studio_row_count=?,studio_col_count=?,studio_introduction=?,studio_flag=?";
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
    public ArrayList<StudioMODEL> findStudioAll()
    {
        ArrayList<StudioMODEL> list = new ArrayList<StudioMODEL>();
        StudioMODEL info = null;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有演出厅信息
            pstmt = con.prepareStatement("select * from studio");
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                info = new StudioMODEL();
                info.setStudio_id(rs.getInt("studio_id"));
                info.setStudio_name(rs.getString("studio_name"));
                info.setStudio_row_count(rs.getInt("studio_row_count"));
                info.setStudio_col_count(rs.getInt("studio_col_count"));
                info.setStudio_introduction(rs.getString("studio_introduction"));
                info.setStudio_flag(rs.getInt("studio_flag"));
                // 加入列表
                list.add(info);
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
    public ArrayList<StudioMODEL> findStudioById(String studio_name)
    {
        if(studio_name == null || studio_name.equals(""))
            return null;

        ArrayList<StudioMODEL> list = new ArrayList<StudioMODEL>();
        StudioMODEL info = null;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有演出厅信息:模糊查询
            pstmt = con.prepareStatement("select * from studio where studio_name like ?");
            pstmt.setString(1, "%" + studio_name + "%");// 拼接模糊查询串
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                info = new StudioMODEL();
                info.setStudio_id(rs.getInt("studio_id"));
                info.setStudio_name(rs.getString("studio_name"));
                info.setStudio_row_count(rs.getInt("studio_row_count"));
                info.setStudio_col_count(rs.getInt("studio_col_count"));
                info.setStudio_introduction(rs.getString("studio_introduction"));
                info.setStudio_flag(rs.getInt("studio_flag"));

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
    public StudioMODEL findStudioByFlag(int flag)
    {
        StudioMODEL info = null;
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据
            pstmt = con.prepareStatement("select * from user where flag=?");
            pstmt.setInt(1, flag);
            rs = pstmt.executeQuery();
            if(rs.next())
            {
                // 如果有值的话再实例化
                info = new StudioMODEL();
                info.setStudio_flag(flag);
                info.setStudio_id(rs.getInt("studio_id"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            ConnectionManager.close(rs, pstmt, con);
            return info;
        }
    }
}
