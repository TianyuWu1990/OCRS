package com.yang.ocrs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
@Service
public class EmailService {
	@Autowired
	private MailSender emailSender;

	public MailSender getEmailSender() {
		return emailSender;
	}

	public void setEmailSender(MailSender emailSender) {
		this.emailSender = emailSender;
	}
	public void sendMail(String receiver, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("zhengyang1988@gmail.com");
		message.setTo(receiver);
		message.setSubject(subject);
		message.setText(text);
		emailSender.send(message);	
	}
}
