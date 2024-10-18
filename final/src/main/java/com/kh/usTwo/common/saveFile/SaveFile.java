package com.kh.usTwo.common.saveFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class SaveFile {
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20240926150855"
		int random = (int)(Math.random() * 90000 + 10000); // 32421 (5자리 랜덤값)
		String ext = originName.substring(originName.lastIndexOf(".")); // ".png"
		
		String changeName = currentTime + random + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로를 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/upfiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}

}
