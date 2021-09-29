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
	
	public int insertPostNoneImage(@Param("userId") int userId,
									@Param("userName") String userName,
									@Param("userNickname") String userNickname,
									@Param("title") String title,
									@Param("content") String content);
	
	public List<Post> selectPostList();

	public List<Post> selectSearchList(@Param("search") String search);
	
	public Post selectDetailPost(@Param("id") int id);

	public Post selectPostAll();
	
	//글 삭제
	public int deletePost(@Param("postId") int postId,
							@Param("userId") int userId);
	
	//글 수정
	public int updatePost(@Param("title") String title,
							@Param("content") String content,
							@Param("imagePath") String imagePath,
							@Param("userId") int userId,
							@Param("id") int id);
	
	public int updatePostNontImage(@Param("title") String title,
							@Param("content") String content,
							@Param("userId") int userId,
							@Param("id") int id);


}
