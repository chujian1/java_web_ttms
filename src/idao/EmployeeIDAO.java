package idao;

import java.util.ArrayList;

import model.EmployeeMODEL;

/**
 * 定义对用户表的增删改查接口
 */
public interface EmployeeIDAO
{
    // 增
    public boolean insert(EmployeeMODEL employee);

    // 删
    public boolean delete(int employeeId);

    // 改
    public boolean update(EmployeeMODEL employee);

    // 查所有用户(一般用于和界面交互)
    public ArrayList<EmployeeMODEL> findEmployeeAll();

    // 根据用户名查(一般用于和界面交互)
    public ArrayList<EmployeeMODEL> findEmployeeByName(String employeeName);

    // 根据用户id查(一般用于数据内部关联操作)
    public EmployeeMODEL findEmployeeById(int employeeId);
}