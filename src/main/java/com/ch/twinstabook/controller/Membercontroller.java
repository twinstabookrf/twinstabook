package com.ch.twinstabook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.twinstabook.service.MemberService;

@Controller
public class Membercontroller {
	@Autowired
	private MemberService mb;
	
	public String main() {
		return "main";
	}
	
}
