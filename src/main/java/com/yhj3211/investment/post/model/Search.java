package com.yhj3211.investment.post.model;

import java.util.Date;
import java.util.List;

public class Search {
	private List<Post> post;
	private String keyword;

	

	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public List<Post> getPost() {
		return post;
	}
	public void setPost(List<Post> post) {
		this.post = post;
	}
	
	
	
}
