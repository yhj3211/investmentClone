package com.yhj3211.investment.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yhj3211.investment.common.FileManagerService;
import com.yhj3211.investment.post.comment.dao.CommentDAO;
import com.yhj3211.investment.post.comment.model.Comment;
import com.yhj3211.investment.post.comment.model.PostWithComments;
import com.yhj3211.investment.post.dao.PostDAO;
import com.yhj3211.investment.post.model.Post;
import com.yhj3211.investment.post.model.Search;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentDAO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId, String userName, String userNickname, String title, String content, MultipartFile file){ 
		
		if(file != null) {
		FileManagerService fileManager = new FileManagerService();
		
		String filePath = fileManager.saveFile(userId, file);
		
		if(filePath == null) {
			return -1;
		}
	
	return postDAO.insertPost(userId, userName, userNickname, title, content, filePath);

}else {
	return postDAO.insertPostNoneImage(userId, userName, userNickname, title, content);
}
}

	public Post getPostListAll(){
		return postDAO.selectPostAll();
	}

	public List<PostWithComments> getPostList(int userId, String search, String keyword){
		
		List<Post> postList = null;
		
		if(keyword != null) {
			postList = postDAO.selectSearchList(search, keyword);
		}else {
			postList = postDAO.selectPostList();
		}
		
		List<PostWithComments> postWithCommentsList = new ArrayList<>();
		
		for(Post post:postList) {
			List<Comment> commentList = commentBO.selectCommentList(post.getId());
			PostWithComments postWithComments = new PostWithComments();
			
			int likeCount = likeBO.getLikeCount(post.getId());
			
			postWithComments.setLikecount(likeCount);
			postWithComments.setPost(post);
			postWithComments.setCommentList(commentList);
			
			postWithCommentsList.add(postWithComments);
			
		}
		return postWithCommentsList;
	}

	public List<PostWithComments> getAllList(int userId){
		
		List<Post> PostList = postDAO.selectPostList();
		List<PostWithComments> postWithCommentsList = new ArrayList<>();
		
		for(Post post:PostList) {
			List<Comment> commentList = commentBO.selectCommentList(post.getId());
			PostWithComments postWithComments = new PostWithComments();
			
			boolean isLike = likeBO.existLike(userId, post.getId());
			int likeCount = likeBO.getLikeCount(post.getId());
			
			postWithComments.setPost(post);
			postWithComments.setCommentList(commentList);
			postWithComments.setLike(isLike);
			postWithComments.setLikecount(likeCount);
			
			postWithCommentsList.add(postWithComments);

		}
		return postWithCommentsList;
	}

	//포스트 상세
	public Post getDetailPost(int id) {
		return postDAO.selectDetailPost(id);
	}

	//글 삭제
	public boolean deletePost(int postId, int userId) {
		
		int count = postDAO.deletePost(postId, userId);
		
		if(count == 1) {
			commentBO.deleteCommentByPostId(postId);
			likeBO.deletelikeByPostId(postId);
			return true;
		}else {
			return false;
		}

	}

	//글 수정
	public int updatePost(int userId, String title, String content, MultipartFile file, int id) {
		
		if(file != null) {
			FileManagerService filemanager = new FileManagerService();
			
			String filePath = filemanager.saveFile(userId, file);
			if(filePath == null) {
				return -1;
			}
		return postDAO.updatePost(title, content, filePath,userId, id);
		}else {
			return postDAO.updatePostNontImage(title, content, userId, id);
		}
	}

	
	
}