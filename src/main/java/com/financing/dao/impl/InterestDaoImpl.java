package com.financing.dao.impl;

import com.financing.dao.InterestDao;
import com.financing.entity.Interest;
import com.financing.entity.Project;
import com.financing.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Penny on 2018/5/21.
 */

@Repository
public class InterestDaoImpl implements InterestDao {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void insert(Interest interest) {
        Session session = sessionFactory.getCurrentSession();
        session.save(interest);
        System.out.println(interest);
    }

    @Override
    public List<Interest> queryByUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Interest where user = ?");
        query.setEntity(0,user);
        List<Interest> interests  = query.list();

        return interests;
    }

    @Override
    public void delete(Interest interest) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(interest);
    }

    @Override
    public List<Interest> queryByUP(User user, Project project) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Interest where user = ? and project = ?");
        query.setEntity(0,user);
        query.setEntity(1,project);
        List<Interest> interests  = query.list();
        return interests;

    }
}
