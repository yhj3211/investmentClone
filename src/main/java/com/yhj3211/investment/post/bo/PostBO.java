package com.yhj3211.investment.post.bo;

import java.util.ArrayList;
import java.util.List;

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
	int count2 = postDAO.insertUserNoneImage(userId, userName, userNickname, title, content);
	
	return count2;
}
}

	public Post getPostListAll(){
		return postDAO.selectPostAll();
	}

	public List<PostWithComments> getPostList(int userId, String search){
		
		List<Post> postList = null;
		if(search != null) {
			postList = postDAO.selectSearchList(search);
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

	
	
}