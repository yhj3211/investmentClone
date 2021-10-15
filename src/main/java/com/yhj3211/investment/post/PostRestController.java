package com.yhj3211.investment.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yhj3211.investment.post.bo.HopeBO;
import com.yhj3211.investment.post.bo.LikeBO;
import com.yhj3211.investment.post.bo.PostBO;


@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired
	private HopeBO hopeBO;
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private LikeBO likeBO;

	
	@PostMapping("/create")
	public Map<String, String> addPost(@RequestParam("title") String title,
										@RequestParam("content") String content,
										@RequestParam(required=false) MultipartFile file,
										HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		Map<String, String> result = new HashMap<>();
		
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		String userNickname = (String)session.getAttribute("userNickname");
		
		int count = postBO.addPost(userId, userName, userNickname, title, content, file);
		
		if(count == 1) {
			result.put("result", "success");
		}else{
			result.put("result", "fail");
		}
		
		return result;	
	}

	

	//좋아요
	@GetMapping("/like")
	public Map<String, Object> like(@RequestParam("postId") int postId,
									HttpServletRequest request){
		
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int likeCount = likeBO.getLikeCount(postId);
		boolean isLike = likeBO.like(userId, postId);
		
		if(likeBO.existLike(postId, userId) == true) {
			isLike = false;
		}else {
			isLike = true;
		}
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("like", isLike);
		result.put("ilkeCount", likeCount);
		
		return result;
	}
	
	//글 삭제
		@GetMapping("/deletePost")
		public Map<String, String> deletePost(@RequestParam("postId") int postId,
												HttpServletRequest request){
			
			HttpSession session = request.getSession();
			int userId = (Integer) session.getAttribute("userId");
			
			Map<String, String> result = new HashMap<>();
			
			boolean count = postBO.deletePost(postId, userId);
			
			if(count == true) {
				result.put("result", "success");
			}else {
				result.put("result", "fail");
			}
			return result;
		}
		
	//글 수정
		@PostMapping("/updatePost")
		public Map<String, String> updatePost(@RequestParam("title") String title,
												@RequestParam("content") String content,
												@RequestParam("id") int id,
												@RequestParam(required=false) MultipartFile file,
												HttpServletRequest request
												){
			
			HttpSession session = request.getSession();
			int userId = (Integer) session.getAttribute("userId");
			
			int count = postBO.updatePost(userId, title, content, file, id);
			Map<String, String> result = new HashMap<>();
			
			
			if(count == 1) {
				result.put("result", "success");
			}else {
				result.put("result", "fail");
			}
			return result;
		}
		
	//존버 소원 적기
		@GetMapping("/createHope")
		public Map<String, String> insertHope(HttpServletRequest request,
												@RequestParam("content") String content)
		{
			
				Map<String, String> result = new HashMap<>();
				
				HttpSession session = request.getSession();
				int userId = (Integer)session.getAttribute("userId");
				String userNickname = (String)session.getAttribute("userNickname");
				
				int count = hopeBO.insertHope(userId, userNickname, content);
				
				if(count == 1) {
					result.put("result", "success");
				}else {
					result.put("result", "fail");
				}
			return result;
		}
}
