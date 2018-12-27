package com.financing.service;

import com.financing.entity.Category;

import java.util.List;
import java.util.Map;

public interface CategoryService {
    List<Category> getCategoryList();
    List<Map<String,Object>> getStatistic();
    void addCategory(Category category);
}
