package com.ch.twinstabook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.twinstabook.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService ps;
	
	@RequestMapping("main")
	public String main() {
		return "main";
	}
	@RequestMapping("postWriteForm")
	public String postWriteForm() {
		return "post/postWriteForm";
	}
}
