package com.yhj3211.investment.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yhj3211.investment.user.model.Message;

@Repository
public interface MessageDAO {

	
	public int insertMessage(@Param("sendUserId") int sendUserId,
								@Param("takeUserId") int takeUserId,
								@Param("content") String content);
	
	public Message getMessage(@Param("takeUserId") int takeUserId);	
}
