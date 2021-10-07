package com.yhj3211.investment.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhj3211.investment.post.bo.PostBO;
import com.yhj3211.investment.post.comment.model.PostWithComments;
import com.yhj3211.investment.user.bo.MessageBO;
import com.yhj3211.investment.user.bo.UserBO;
import com.yhj3211.investment.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private MessageBO messageBO;
	
	@Autowired
	private PostBO postBO;
	
	//로그인
	@GetMapping("/sign_in")
	public String signin_view() {
		return "/investment/signin";
	}
	
	//회원가입
	@GetMapping("/sign_up")
	public String signup_view() {
		return "/investment/signup";
	}
	
	//로그 아웃
	@GetMapping("/sign_out")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userNickname");
		session.removeAttribute("loginId");
		
		return "/investment/signin";
	}
	
	//마이페이지
	@GetMapping("/mypage")
	public String mypage(HttpServletRequest request,
							Model model) {
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		User user = userBO.userInfo(loginId);
		
		model.addAttribute("user", user);
		
		return "/investment/mypage";
	}
	
	//메세지페이지
	@GetMapping("/message")
	public String messagePost(Model model,
								HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostWithComments> postList = postBO.getAllList(userId);
		User user = userBO.userInfo(loginId);
	
		model.addAttribute("postList", postList);
		model.addAttribute("user", user);
		
		return "/investment/messagePost";
	}
	
}