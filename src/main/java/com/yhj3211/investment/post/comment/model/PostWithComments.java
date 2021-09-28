package com.yhj3211.investment.post.comment.model;

import java.util.List;

import com.yhj3211.investment.post.model.Post;
import com.yhj3211.investment.post.model.Search;

public class PostWithComments {

	private Post post;
	private List<Comment> commentList;
	private boolean isLike;
	private int likeCount;
	
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public int getLikecount() {
		return likeCount;
	}
	public void setLikecount(int likecount) {
		this.likeCount = likecount;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

}
