package com.yhj3211.investment.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhj3211.investment.post.dao.HopeDAO;
import com.yhj3211.investment.post.model.Hope;

@Service
public class HopeBO {

	@Autowired HopeDAO hopeDAO;
	
	public int insertHope(int userId, String userNickname, String content) {
		return hopeDAO.insertHope(userId, userNickname, content);
	}
	
	public List<Hope> selectHopeList(){
		
		return hopeDAO.selectHopeList();
	}
}
