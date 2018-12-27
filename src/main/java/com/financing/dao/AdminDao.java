package com.financing.dao;

import com.financing.entity.Admin;

public interface AdminDao {
    Admin queryByName(String username);
}
