package com.yhj3211.investment.user.model;

import java.sql.Date;

public class Message {
	
	private int id;
	private int sendUserId;
	private int takeUserId;
	private String content;
	private String sendUserNickname;
	private String takeUserNickname;
	private Date createdAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSendUserId() {
		return sendUserId;
	}
	public void setSendUserId(int sendUserId) {
		this.sendUserId = sendUserId;
	}
	public int getTakeUserId() {
		return takeUserId;
	}
	public void setTakeUserId(int takeUserId) {
		this.takeUserId = takeUserId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public String getSendUserNickname() {
		return sendUserNickname;
	}
	public void setSendUserNickname(String sendUserNickname) {
		this.sendUserNickname = sendUserNickname;
	}
	public String getTakeUserNickname() {
		return takeUserNickname;
	}
	public void setTakeUserNickname(String takeUserNickname) {
		this.takeUserNickname = takeUserNickname;
	}
	
	

}
