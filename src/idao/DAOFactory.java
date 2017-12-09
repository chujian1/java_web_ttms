package idao;

import dao.EmployeeDAO;
import dao.StudioDAO;
import dao.UserDAO;

public class DAOFactory
{
    public static EmployeeDAO creatEmployeeDAO()
    {
        return new EmployeeDAO();
    }

    public static UserDAO creatUserDAO()
    {
        return new UserDAO();
    }

    public static StudioDAO creatStudioDAO()
    {
        return new StudioDAO();
    }
}