package com.financing.dao;

import com.financing.entity.Project;
import com.financing.entity.ProjectUpdate;

import java.util.List;

public interface ProjectUpdateDao {
    void insert(ProjectUpdate projectUpdate);
    List<ProjectUpdate> queryAll(Project project);
}
