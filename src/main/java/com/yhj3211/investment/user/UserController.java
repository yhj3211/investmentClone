package com.yhj3211.investment.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yhj3211.investment.user.bo.UserBO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserBO userBO;
	
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
	
	
}