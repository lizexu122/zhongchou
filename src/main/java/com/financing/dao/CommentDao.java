package com.financing.dao;

import com.financing.entity.Comment;
import com.financing.entity.Project;
import com.financing.entity.User;

import java.util.List;

public interface CommentDao {
    void insert(Comment comment);
    List<Comment> queryAll(Project project);
    List<Comment> queryByOwner(User user);
    List<Comment> queryByTarget(User user);
}
