package com.yhj3211.investment.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yhj3211.investment.post.comment.bo.CommentBO;

@RestController
@RequestMapping("/comment")
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@GetMapping("/create")
	public Map<String, String> addComment(@RequestParam("content") String content,
											@RequestParam("postId") int postId,
											HttpServletRequest request){
		
		Map<String, String> result = new HashMap<>();
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String userNickname = (String)session.getAttribute("userNickname");
		
		int count = commentBO.addComment(postId, userId, userNickname, content);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
}
