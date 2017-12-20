package idao;

import java.util.ArrayList;

import model.UserMODEL;

public interface UserIDAO
{
    // 增
    public boolean insert(String userNo);

    // 删
    public boolean delete(String emp_no);

    // 改
    public boolean update(UserMODEL user);

    // 查所有User用户
    public ArrayList<UserMODEL> findUserAll();

    // 根据用户编号查
    public ArrayList<UserMODEL> findUserByNo(String userNo);

    // 根据用户编号确定一个
    public UserMODEL findUserByNO(String userNo);

    // 根据用户type查(一般用于数据内部关联操作)
    public UserMODEL findUserByType(int type);
}