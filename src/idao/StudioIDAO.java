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
    public StudioMODEL findStudioById(int studioId);

    // 根据演出厅名查(一般用于和界面交互)
    public ArrayList<StudioMODEL> findStudioByName(String studioName);
}