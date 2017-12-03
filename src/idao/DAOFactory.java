package idao;

import dao.EmployeeDAO;
import dao.UserDAO;

public class DAOFactory
{
    public static EmployeeIDAO creatEmployeeDAO()
    {
        return new EmployeeDAO();
    }

    public static UserDAO creatUserDAO()
    {
        return new UserDAO();
    }
}