package com.ch.twinstabook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.twinstabook.dao.PostDao;

@Service
public class PostServiceImpl implements PostService{
	@Autowired
	private PostDao pd;
}
