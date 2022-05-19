package com.ch.twinstabook.dao;

import java.util.List;

import com.ch.twinstabook.model.Reply;

public interface ReplyDao {

	int insert(Reply reply);

	List<Reply> list(int postno);

	String firstLike(int postno);

	int deleteAll(int postno);

}
