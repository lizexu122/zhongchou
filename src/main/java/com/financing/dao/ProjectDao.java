package com.financing.dao;

import com.financing.entity.Category;
import com.financing.entity.Project;
import com.financing.entity.User;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface ProjectDao {
    String insert(Project project) throws Exception;
    void update(Project project) throws Exception;
    Project queryById(String id) throws Exception;
    List<Project> queryAll();
    List<Project> queryAllByLimit(int BeginIndex, int EveryPage);
    List<Project> queryNewProject()throws Exception;
    List<Project> queryHotProject()throws Exception;
    void delete(String id) throws Exception;
    long queryProjectCount();//项目总数
    long queryProjectFinished();//已完成目标项目总数
    long querySupportCount();//参与支持总数
    List<Project> queryNewProjectTop();
    List<Project> queryHotProjectTop();
    List<Project> queryProjectTopByCID(Category category);
    List<Project> queryProjectByCID(Category category);
    List<Project> queryProjectByKey(String keyword);//根据关键字查询项目
    List<Project> queryByUser(User user);
    void updateSupport(Project project, BigDecimal amount,int action);
    void updatePraise(Project project,int action);
    List<Project> queryFinancingStaticTop();
    List<Map<String,Object>> queryProjectStatistic();
}
