package com.financing.service;

import com.financing.entity.Project;
import com.financing.entity.ProjectUpdate;

import java.util.List;

public interface ProjectUpdateService {
    void addUpdate(ProjectUpdate update);
    List<ProjectUpdate> getUpdateList(Project project);
}
