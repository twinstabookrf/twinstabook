package com.ch.twinstabook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.twinstabook.model.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	@Autowired
	private SqlSessionTemplate sst;
	@Override
	public int insert(Reply reply) {
		return sst.insert("replyns.insert",reply);
	}
	@Override
	public List<Reply> list(int postno) {
		return sst.selectList("replyns.list",postno);
	}
	@Override
	public String firstLike(int postno) {
		return sst.selectOne("replyns.firstLike",postno);
	}
}
