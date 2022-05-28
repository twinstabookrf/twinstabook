package com.ch.twinstabook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.twinstabook.service.FollowService;
import com.ch.twinstabook.service.MediaService;
import com.ch.twinstabook.service.MemberService;
import com.ch.twinstabook.service.PostService;
import com.ch.twinstabook.service.ReTwinService;
import com.ch.twinstabook.service.ReplyService;

@Controller
public class ReTwinController {
	@Autowired
	ReTwinService rts;
	@Autowired
	private MemberService ms;
	@Autowired
	private PostService ps;
	@Autowired
	private ReplyService rs;
	@Autowired
	private MediaService mds;
	@Autowired
	private FollowService fs;
}
