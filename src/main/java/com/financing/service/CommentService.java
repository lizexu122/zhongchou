package com.financing.service;

import com.financing.entity.Comment;
import com.financing.entity.Project;
import com.financing.entity.User;

import java.util.List;

public interface CommentService {
    void addComment(Comment comment);
    List<Comment> getCommentList(Project project);
    List<Comment> getOwnerCommentList(User user);
    List<Comment> getTargetCommentList(User user);
}
