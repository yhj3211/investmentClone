package com.yhj3211.investment.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhj3211.investment.common.EncryptUtils;
import com.yhj3211.investment.user.dao.UserDAO;
import com.yhj3211.investment.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	//회원가입
	public int insertUser(String loginId, String password, String name, String email, String nickname) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email, nickname);
		
		
	}
	
	//로그인
	public User selectUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
	
	//아이디 중복확인
	public int idDuplicate(String loginId) {
		return userDAO.idDuplicate(loginId);
	}
	
	//닉네임 중복확인
	public int nicknameDup(String nickname) {
		return userDAO.nicknameDup(nickname);
	}
	
}
