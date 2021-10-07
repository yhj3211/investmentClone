package com.yhj3211.investment.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhj3211.investment.user.dao.MessageDAO;
import com.yhj3211.investment.user.model.Message;

@Service
public class MessageBO {

	@Autowired
	private MessageDAO messageDAO;
	
	public int sendMessage(int sendUserId, int takeUserId, String content) {
		return messageDAO.insertMessage(sendUserId, takeUserId, content);
	}
	
	public List<Message> getTakeMessageList(int userId){
		List<Message> takeMessageList = messageDAO.selectTakeMessageList(userId);
		return takeMessageList;
	}
	
	public List<Message> getSendMessageList(int userId) {
		List<Message> sendMessageList = messageDAO.selectSendMessageList(userId);
		return sendMessageList;
	}
	
}
