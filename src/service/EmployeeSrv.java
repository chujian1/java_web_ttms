package service;

import idao.DAOFactory;

import java.util.List;

import model.EmployeeMODEL;
import dao.EmployeeDAO;

public class EmployeeSrv
{
    private EmployeeDAO empDAO = DAOFactory.creatEmployeeDAO();

    public boolean add(EmployeeMODEL emp)
    {
        return empDAO.insert(emp);
    }

    public boolean update(EmployeeMODEL emp)
    {
        return empDAO.update(emp);
    }

    public boolean delete(int ID)
    {
        return empDAO.delete(ID);
    }

    public List<EmployeeMODEL> FetchAll()
    {
        return empDAO.findEmployeeAll();
    }

    public EmployeeMODEL findEmployeeById(int id)
    {
        return empDAO.findEmployeeById(id);
    }

}
