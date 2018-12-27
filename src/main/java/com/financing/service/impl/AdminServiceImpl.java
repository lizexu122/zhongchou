package com.financing.service.impl;

import com.financing.dao.AdminDao;
import com.financing.entity.Admin;
import com.financing.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin getAdmin(String username) {
        return adminDao.queryByName(username);
    }
}
