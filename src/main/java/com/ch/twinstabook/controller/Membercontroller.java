package com.ch.twinstabook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.twinstabook.service.MemberService;

@Controller
public class Membercontroller {
	@Autowired
	private MemberService mb;
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "join/loginForm";
	}
	@RequestMapping("signUpForm")
	public String signUpForm() {
		return "join/signUpForm";
	}
	@RequestMapping("login")
	public String login() {
		
		//로그인확인만들기
			
		return "join/login";
	}
	@RequestMapping("pwdHint")
	public String pwdHint() {
		return "join/pwdHint";
	}
	
}
