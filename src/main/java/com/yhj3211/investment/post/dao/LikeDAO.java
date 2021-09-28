package com.yhj3211.investment.post.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	//좋아요를 추가
	public int addLike(@Param("postId") int postId,
						@Param("userId") int userId);
	
	public int selectCountLike(@Param("postId") int postId,
								@Param("userId") int userId);

	//좋아요 여부 확인
	public int deletelike(@Param("postId") int postId,
							@Param("userId") int userId);
	
	//좋아요 갯수 가져오기
	public int selectLikePostId(@Param("postId") int postId);
	
	//좋아요 취소
	public int deleteLike(@Param("postId") int postId,
							@Param("userId") int userId);




	
}
