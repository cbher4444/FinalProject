package com.kh.usTwo.api.service;

import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements emailService{

	private static final Logger log = LoggerFactory.getLogger(EmailServiceImpl.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void sendSingle(Map<String, Object> params) {
		String recipient = params.get("recipient").toString();
		String title = params.get("title").toString();
		String content = params.get("contents").toString();
		
		String htmlText = "";
		
		log.info(params.toString());
		
		MimeMessage mimMessage = mailSender.createMimeMessage();
		
		try {
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			
			mimeMessage.setFrom(new InternetAddress("dlxor968@gmail.com", "test", "utf-8"));
			mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(recipient));
			mimeMessage.setSubject(title, "utf-8");
			
			htmlText = "<div id=\"mailView\" style=\"background-color: #f9f9f9;padding: 40px;\">\r\n" + 
					"	<pre style='margin-top:0;margin-bottom:20px;'>" +
						"contents" +
					"	</pre>" +
					"	<a href=\"https://kje1218.tistory.com/\" target=\"_blank\" style=\"\r\n" + 
					"		text-decoration-line:none;text-decoration-line:none;display:inline-block;padding:10px 20px;color:black;background-color:#e1e1e1;border-radius:5px;\">블로그 바로가기</a>\r\n" + 
					"	\r\n" + 
					"</div>";
			
			mimeMessage.setContent(htmlText, "text/html; charset=utf-8");
 
		    mailSender.send(mimeMessage);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
