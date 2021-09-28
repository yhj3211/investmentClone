package com.yhj3211.investment.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yhj3211.investment.post.comment.model.PostWithComments;
import com.yhj3211.investment.post.model.Post;
import com.yhj3211.investment.post.model.Search;

@Repository
public interface PostDAO {

	public int insertPost(@Param("userId") int userId,
							@Param("userName") String userName,
							@Param("userNickname") String userNickname,
							@Param("title") String title,
							@Param("content") String content,
							@Param("imagePath") String imagePath);
	
	public int insertUserNoneImage(@Param("userId") int userId,
									@Param("userName") String userName,
									@Param("userNickname") String userNickname,
									@Param("title") String title,
									@Param("content") String content);
	
	public List<Post> selectPostList();

	public List<Search> selectSearchList(@Param("keyword") String keyword);
	
	public Post selectDetailPost(@Param("id") int id);

	public Post selectPostAll();
}
