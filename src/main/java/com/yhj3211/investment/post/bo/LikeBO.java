package com.yhj3211.investment.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhj3211.investment.post.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public boolean existLike(int postId, int userId) {
		int count = likeDAO.selectCountLike(postId, userId);
		
		if(count >= 1) {
			return true;
		}else{
			return false;
		}
	}
	
	//좋아요 관리
	public boolean like(int userId, int postId) {
		if(this.existLike(postId, userId) == true) {
			likeDAO.deleteLike(postId, userId);
			return false;
		}else {
			likeDAO.addLike(postId, userId);
			return true;
		}
	}
	
	//좋아요 갯수 가져오기	
	public int getLikeCount(int postId) {
		return likeDAO.selectLikePostId(postId);
	}
	
	//글 전체 삭제 중 좋아요 삭제
	public int deletelikeByPostId(int postId) {
		return likeDAO.deletelikeByPostId(postId);
	}

}
