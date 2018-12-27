package com.financing.dao;

import com.financing.entity.Project;
import com.financing.entity.ProjectBack;

import java.util.List;

public interface ProjectBackDao {
    void insert(ProjectBack projectBack);
    List<ProjectBack> queryAll(Project project);
    void update(ProjectBack projectBack);
    ProjectBack queryById(int id);
    void updateActual(ProjectBack projectBack,int action);
}
