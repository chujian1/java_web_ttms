package dao;

import idao.UserIDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.UserMODEL;
import mysql.ConnectionManager;

public class UserDAO implements UserIDAO
{
    public static final int PAGE_SIZE = 5; // 每页显示条数
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
    public ArrayList<UserMODEL> findUSerByPage(int cPage, String emp_no)
    {
        currentPage = cPage;
        ArrayList<UserMODEL> list = new ArrayList<UserMODEL>();

        // 若未指定查找演出厅，则默认全查
        if(null == emp_no || emp_no.equals("null"))
        {
            emp_no = "";
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取记录总数
            String sql1 = "select count(emp_no) as AllRecord from user where emp_no like ?";
            conn = ConnectionManager.getInstance().getConnection();
            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, "%" + emp_no + "%");
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
            String sql2 = "select * from user where emp_no like ? limit ?,?";
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, "%" + emp_no + "%");
            pstmt.setInt(2, PAGE_SIZE * (currentPage - 1));
            pstmt.setInt(3, PAGE_SIZE);
            rs = pstmt.executeQuery();
            UserMODEL user = null;
            while(rs.next())
            {
                user = new UserMODEL();
                user.setEmp_no(rs.getString("emp_no"));
                user.setEmp_pass(rs.getString("emp_pass"));
                user.setType(rs.getInt("type"));
                // 将该用户信息插入列表
                list.add(user);
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

    @SuppressWarnings("finally")
    public boolean insert(String userNo)
    {
        boolean result = false;
        if(userNo == "")
            return result;
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            String sql = "insert into User(emp_no, emp_pass, type,head_path) values(?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userNo);
            pstmt.setString(2, "123456");
            pstmt.setInt(3, 0);
            pstmt.setString(4, "");

            pstmt.executeUpdate();
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

    @SuppressWarnings("finally")
    public boolean delete(String emp_no)
    {
        boolean result = false;
        if(emp_no == null)
            return result;
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            // 删除子某个用户
            String sql = "delete from user where emp_no=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, emp_no);
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

    @SuppressWarnings("finally")
    public boolean update(UserMODEL user)
    {
        boolean result = false;
        if(user == null)
            return result;
        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        try
        {
            String sql = "update user set emp_no=?,emp_pass=?,type=?,head_path=? where emp_no=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user.getEmp_no());
            pstmt.setString(2, user.getEmp_pass());
            pstmt.setInt(3, user.getType());
            pstmt.setString(4, user.getHead_path());
            pstmt.setString(5, user.getEmp_no());
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

    @SuppressWarnings("finally")
    public ArrayList<UserMODEL> findUserAll()
    {
        ArrayList<UserMODEL> list = new ArrayList<UserMODEL>();
        UserMODEL info = null;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据
            pstmt = con.prepareStatement("select * from user");
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                info = new UserMODEL();
                info.setEmp_no(rs.getString("emp_no"));
                info.setEmp_pass(rs.getString("emp_pass"));
                info.setType(rs.getInt("type"));
                info.setHead_path(rs.getString("head_path"));
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

    @SuppressWarnings("finally")
    public ArrayList<UserMODEL> findUserByNo(String userNO)
    {
        if(userNO == null || userNO.equals(""))
            return null;

        ArrayList<UserMODEL> list = new ArrayList<UserMODEL>();
        UserMODEL info = null;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据:模糊查询
            pstmt = con.prepareStatement("select * from user where emp_no like ?");
            pstmt.setString(1, "%" + userNO + "%");// 拼接模糊查询串
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                // 如果有值的话再实例化
                info = new UserMODEL();

                info.setEmp_no(rs.getString("emp_no"));
                info.setEmp_pass(rs.getString("emp_pass"));
                info.setType(rs.getInt("type"));
                info.setHead_path(rs.getString("head_path"));

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

    @SuppressWarnings("finally")
    public UserMODEL findUserByNO(String userNo)
    {
        UserMODEL info = null;
        if(userNo == null)
            return info;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据
            pstmt = con.prepareStatement("select * from user where emp_no=?");
            pstmt.setString(1, userNo);
            rs = pstmt.executeQuery();
            if(rs.next())
            {
                // 如果有值的话再实例化
                info = new UserMODEL();
                info.setEmp_no(rs.getString("emp_no"));
                info.setEmp_pass(rs.getString("emp_pass"));
                info.setType(rs.getInt("type"));
                info.setHead_path(rs.getString("head_path"));
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

    @Override
    public UserMODEL findUserByType(int type)
    {
        // TODO 自动生成的方法存根
        return null;
    }

    public UserMODEL findUserByNoAndPass(String name, String pass)
    {
        // TODO 自动生成的方法存根

        UserMODEL info = null;

        Connection con = ConnectionManager.getInstance().getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            // 获取所有用户数据
            pstmt = con.prepareStatement("select * from user where emp_no = ? and emp_pass = ?");
            pstmt.setString(1, name);
            pstmt.setString(2, pass);
            rs = pstmt.executeQuery();
            if(rs.next())
            {
                // 如果有值的话再实例化
                info = new UserMODEL();
                info.setEmp_no(rs.getString("emp_no"));
                info.setEmp_pass(rs.getString("emp_pass"));
                info.setType(rs.getInt("type"));
                info.setHead_path(rs.getString("head_path"));
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