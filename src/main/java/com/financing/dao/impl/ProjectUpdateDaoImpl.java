package com.financing.dao.impl;

import com.financing.dao.ProjectUpdateDao;
import com.financing.entity.Project;
import com.financing.entity.ProjectUpdate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProjectUpdateDaoImpl implements ProjectUpdateDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insert(ProjectUpdate projectUpdate) {
        Session session = sessionFactory.getCurrentSession();
        session.save(projectUpdate);
        System.out.println("///"+projectUpdate);
    }

    @Override
    public List<ProjectUpdate> queryAll(Project project) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from ProjectUpdate where project = ? order by updateTime desc ");
        query.setEntity(0,project);
        List<ProjectUpdate> updates = query.list();
        return updates;
    }
}
