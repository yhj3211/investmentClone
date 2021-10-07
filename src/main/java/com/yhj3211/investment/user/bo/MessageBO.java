package com.yhj3211.investment.user.bo;

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
	
	public Message getMessage(int takeUserId) {
		return messageDAO.getMessage(takeUserId);
	}
	
}
