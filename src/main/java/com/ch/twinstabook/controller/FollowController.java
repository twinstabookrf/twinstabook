package com.ch.twinstabook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ch.twinstabook.service.FollowService;

@Controller
public class FollowController {
	@Autowired
	private FollowService fs;
	
}
