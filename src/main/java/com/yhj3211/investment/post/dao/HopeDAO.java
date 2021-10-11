package com.yhj3211.investment.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yhj3211.investment.post.model.Hope;

@Repository
public interface HopeDAO {

	public int insertHope(@Param("userId") int userId,
							@Param("userNickname") String userNickname,
							@Param("content") String content);
	
	public List<Hope> selectHopeList();
	
}
