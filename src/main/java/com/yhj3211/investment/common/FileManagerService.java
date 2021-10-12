package com.yhj3211.investment.common;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final String FILE_UPLOAD_PATH = "/home/ec2-user/upload/";

	//파일 업로드
	
		
	public String saveFile(int loginId, MultipartFile file) {
		//파일 이름 겹침 방지 위해 사용자 별로 디렉토리 생성 후 저장
		//올린 시간별로 구분해서 저장
		
		String directoryName = loginId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		//파일 저장할 디렉토리 생성
		File directory = new File(filePath);
		
		if(!directory.mkdir()) {
			logger.error("[FileManagerService saveFile] 디렉토리 생성 실패");
			return null;
		}
		
		//파일 저장
		//byte
		//1011010101
		byte[] bytes;
		try {
			bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.error("[FileManagerService saveFile] 파일 생성 실패");
			return null;
		}
	
			
		//파일 접근 가능한 path 리턴
		// src = "images/12_12312314/test.png"
		
		return "/images/" + directoryName + file.getOriginalFilename();
	}
}
