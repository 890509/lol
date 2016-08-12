package com.bw.test;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
//	@Autowired
//	private JavaMailSender mailSender;
	
	@Resource(name="mailSender")
	JavaMailSender mailSender;

	@RequestMapping(value = "mail")
	public ModelAndView mainMail(){
		ModelAndView mav = new ModelAndView("writeMail");
		return mav;
	}
	
	@RequestMapping(value = "sendMail")
	private String sendMail(String email_id,String email_name, String email_content) {
		try{
			
			MimeMessage message = mailSender.createMimeMessage();
			message.setSubject("send mail test", "euc-kr");
			String htmlContent = "내용: " + email_content + "이름: " + email_name + "메일주소: " + email_id;
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			message.setText(htmlContent,"euc-kr","html");
			message.setFrom(new InternetAddress("lands@broadwave.co.kr"));
			message.setRecipient(RecipientType.TO, new InternetAddress("lands@broadwave.co.kr"));
			
			
			mailSender.send(message);
			
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return "success";
	}
	
	
}
