package com.yhj3211.investment.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yhj3211.investment.user.model.Message;

@Repository
public interface MessageDAO {

	
	public int insertMessage(@Param("sendUserId") int sendUserId,
								@Param("takeUserId") int takeUserId,
								@Param("content") String content, 
								@Param("sendUserNickname") String sendUserNickname,
								@Param("takeUserNickname") String takeUserNickname);
	
	//받은 메세지 목록
	public List<Message> selectTakeMessageList(@Param("userId") int userId);
	
	//보낸 메세지 목록
	public List<Message> selectSendMessageList(@Param("userId") int userId);
	
	//메세지 삭제
	public int deleteMessage(@Param("userId") int userId);
}
