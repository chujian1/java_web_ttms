package service;

import idao.DAOFactory;

import java.util.ArrayList;
import java.util.List;

import model.UserMODEL;
import dao.UserDAO;

public class UserSrv
{
    private UserDAO userDAO = DAOFactory.creatUserDAO();

    public boolean add(UserMODEL user)
    {
        return userDAO.insert(user);
    }

    public boolean update(UserMODEL user)
    {
        return userDAO.update(user);
    }

    public boolean delete(int ID)
    {
        return userDAO.delete(ID);
    }

    public List<UserMODEL> FetchAll()
    {
        return userDAO.findUserAll();
    }

    public ArrayList<UserMODEL> findUserByNo(String no)
    {
        return userDAO.findUserByNo(no);
    }

    public UserMODEL findUserByType(int type)
    {
        return userDAO.findUserByType(type);
    }

}
