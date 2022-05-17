package com.ch.twinstabook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.twinstabook.model.Reply;
import com.ch.twinstabook.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService rs;
	@RequestMapping("replyInsert")
	public String replyInsert(int postNo, String reply_input,String sessionId, Model model) {
		System.out.println("컨트롤러 진입");
		Reply reply = new Reply();
		int result = 0;
		reply.setContent(reply_input);
		reply.setMember_id(sessionId);
		reply.setPostno(postNo);
		result = rs.insert(reply);
		System.out.println(reply);
		model.addAttribute("result",result);
		return "replyInsert";
	}
}
