package com.ch.twinstabook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.twinstabook.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService ps;
	
	@RequestMapping("main")
	public String main(Model model) {
		model.addAttribute("writer" , "manho");
		model.addAttribute("email" , "cookieValentain@twinstabook.com");
		model.addAttribute("replyWrier" , "cookie");
		model.addAttribute("replyContent" , "잘 봤습니다");
		model.addAttribute("firstLike" , "manomano");
		model.addAttribute("likes" , 99);
		
		return "main";
	}
	@RequestMapping("postWriteForm")
	public String postWriteForm() {
		return "post/postWriteForm";
	}
}
