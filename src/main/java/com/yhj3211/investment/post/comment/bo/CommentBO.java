package com.yhj3211.investment.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhj3211.investment.post.comment.dao.CommentDAO;
import com.yhj3211.investment.post.comment.model.Comment;
import com.yhj3211.investment.post.comment.model.PostWithComments;
import com.yhj3211.investment.post.dao.PostDAO;
import com.yhj3211.investment.post.model.Post;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private PostDAO postDAO;
	
	public int addComment(int postId, int userId, String userNickname, String content) {
		return commentDAO.addComment(postId, userId, userNickname, content);
	}
	
	public List<Comment> getCommentList(int postId) {
		return commentDAO.selectCommentList(postId);
	}
	
	public int deleteComment(int postId, int userId) {
		return commentDAO.deleteComment(postId, userId);
	}
	
	public int deleteCommentByPostId(int postId) {
		return commentDAO.deleteCommentByPostId(postId);
	}
	
}


