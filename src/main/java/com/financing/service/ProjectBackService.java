package com.financing.service;

import com.financing.entity.Project;
import com.financing.entity.ProjectBack;

import java.util.List;

public interface ProjectBackService {
    void addBack(ProjectBack projectBack);
    List<ProjectBack> getBackList(Project project);
    void updateBack(ProjectBack projectBack);
    ProjectBack getBack(int id);
    void updateActual(ProjectBack projectBack,int action);//修改参与回报实际人数
}
