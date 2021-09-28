package com.yhj3211.investment.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yhj3211.investment.user.model.User;

@Repository
public interface UserDAO {

	//회원가입
	public int insertUser(@Param("loginId") String loginId,
						@Param("password") String password,
						@Param("name") String name,
						@Param("email") String email,
						@Param("nickname") String nickname);
	
	//로그인
	public User selectUser(@Param("loginId") String loginId,
							@Param("password") String password);
	
	//아이디 중복확인
	public int idDuplicate(@Param("loginId") String loginId);
	
	//닉네임 중복확인
	public int nicknameDup(@Param("nickname") String nickname);
	
}
