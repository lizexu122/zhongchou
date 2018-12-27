package com.financing.service;

import com.financing.entity.Interest;
import com.financing.entity.Project;
import com.financing.entity.User;

import java.util.List;

public interface InterestService {

    void addInterest(Interest interest);
    void cancelInterest(Interest interest);
    List<Interest> getInterestByUser(User user);
    List<Interest>  getInterestByUP(User user, Project project);
}
