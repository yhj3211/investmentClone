package com.yhj3211.investment.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yhj3211.investment.post.comment.model.Comment;
import com.yhj3211.investment.post.model.Search;

@Repository
public interface CommentDAO {

	public int addComment(@Param("postId") int postId,
							@Param("userId") int userId,
							@Param("userNickname") String userNickname,
							@Param("content") String content);
	
	public List<Comment> selectCommentList(@Param("postId") int postId);

	//댓글 삭제
	public int deleteComment(@Param("postId") int postId,
								@Param("userId") int userid);
	
	//글 전체 삭제 중 댓글 삭제
	public int deleteCommentByPostId(@Param("postId") int postId);
	
	
	
}

