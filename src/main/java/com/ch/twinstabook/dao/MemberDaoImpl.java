package com.ch.twinstabook.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.twinstabook.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sst;
<<<<<<< HEAD
	@Override
	public Member select(String member_id) {
		return sst.selectOne("memberns.select",member_id);
=======

	@Override
	public Member select(String member_id) {
		return sst.selectOne("memberns.select", member_id);
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
	}

<<<<<<< HEAD
=======
	@Override
	public int insert(Member member) {
		return sst.insert("memberns.insert", member);
	}


>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
}
