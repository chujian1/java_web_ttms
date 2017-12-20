package service;

import idao.DAOFactory;

import java.util.ArrayList;
import java.util.List;

import model.UserMODEL;
import dao.UserDAO;

public class UserSrv
{
    private UserDAO userDAO = DAOFactory.creatUserDAO();

    public boolean add(String userNo)
    {
        return userDAO.insert(userNo);
    }

    public boolean update(UserMODEL user)
    {
        return userDAO.update(user);
    }

    public boolean delete(String NO)
    {
        return userDAO.delete(NO);
    }

    public List<UserMODEL> FetchAll()
    {
        return userDAO.findUserAll();
    }

    public ArrayList<UserMODEL> findUserByNo(String no)
    {
        return userDAO.findUserByNo(no);
    }

    public UserMODEL findUserByNO(String no)
    {
        return userDAO.findUserByNO(no);
    }

    public UserMODEL findUserByType(int type)
    {
        return userDAO.findUserByType(type);
    }

    public UserMODEL findUserByNoAndPass(String name, String pass)
    {
        // TODO 自动生成的方法存根

        return userDAO.findUserByNoAndPass(name, pass);
    }

}
