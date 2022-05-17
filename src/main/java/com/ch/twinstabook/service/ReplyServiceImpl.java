package com.ch.twinstabook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.twinstabook.dao.ReplyDao;
import com.ch.twinstabook.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyDao rd;

	@Override
	public int insert(Reply reply) {
		return rd.insert(reply);
	}

	@Override
	public List<Reply> list(int postno) {
		return rd.list(postno);
	}

	@Override
	public String firstLike(int postno) {
		return rd.firstLike(postno);
	}

	@Override
	public int deleteAll(int postno) {
		return rd.deleteAll(postno);
	}
}
