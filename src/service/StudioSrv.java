package service;

import idao.DAOFactory;

import java.util.ArrayList;
import java.util.List;

import model.StudioMODEL;
import dao.StudioDAO;

public class StudioSrv
{
    private StudioDAO studioDAO = DAOFactory.creatStudioDAO();

    public boolean add(StudioMODEL studio)
    {
        return studioDAO.insert(studio);
    }

    public boolean update(StudioMODEL studio)
    {
        return studioDAO.update(studio);
    }

    public boolean delete(int ID)
    {
        return studioDAO.delete(ID);
    }

    public List<StudioMODEL> FetchAll()
    {
        return studioDAO.findStudioAll();
    }

    public ArrayList<StudioMODEL> findStudioById(String id)
    {
        return studioDAO.findStudioById(id);
    }

    public StudioMODEL findStudioByFlag(int flag)
    {
        return studioDAO.findStudioByFlag(flag);
    }

}
