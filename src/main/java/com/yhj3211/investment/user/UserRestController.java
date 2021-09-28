
package com.yhj3211.investment.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yhj3211.investment.user.bo.UserBO;
import com.yhj3211.investment.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	//회원가입
	@PostMapping("/signup")
	public Map<String, String> signin(@RequestParam("loginId") String loginId,
										@RequestParam("password") String password,
										@RequestParam("name") String name,
										@RequestParam("email") String email,
										@RequestParam("nickname") String nickname){
		
		Map<String, String> result = new HashMap<>();
		
		int count = userBO.insertUser(loginId, password, name, email, nickname);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	//로그인
	@PostMapping("/signin")
	public Map<String, String> signin(@RequestParam("loginId") String loginId,
										@RequestParam("password") String password,
										HttpServletRequest request){
	
		HttpSession session = request.getSession();
		
		User user = userBO.selectUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userNickname", user.getNickname());
			session.setAttribute("loginId", user.getLoginId());
			
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
		
	}
	
	//아이디 중복확인
	@GetMapping("/idDuplicate")
	public Map<String, String> idDuplicate(@RequestParam("loginId") String loginId){
		
		Map<String, String> result = new HashMap<>();
		
		int count = userBO.idDuplicate(loginId);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	//닉네임 중복확인
	@GetMapping("nicknameDup")
	public Map<String, String> nicknameDup(@RequestParam("nickname") String nickname){
		
		Map<String, String> result = new HashMap<>();
		
		int count = userBO.nicknameDup(nickname);
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
}
