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
	public String login() {
		return "join/loginForm";
	}
	@RequestMapping("signUpForm")
	public String signUpForm() {
		return "join/signUpForm";
	}
	
}
