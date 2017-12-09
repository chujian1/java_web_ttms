package idao;

import java.util.ArrayList;

import model.StudioMODEL;

public interface StudioIDAO
{
    // 增
    public boolean insert(StudioMODEL studio);

    // 删
    public boolean delete(int studio_id);

    // 改
    public boolean update(StudioMODEL studio);

    // 查所有Studio演出厅
    public ArrayList<StudioMODEL> findStudioAll();

    // 根据演出厅id查
    public ArrayList<StudioMODEL> findStudioById(String studioId);

    // 根据演出厅flag查(一般用于数据内部关联操作)
    public StudioMODEL findStudioByFlag(int flag);
}