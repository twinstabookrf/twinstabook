package com.ch.twinstabook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.twinstabook.dao.MemberDao;
import com.ch.twinstabook.model.Member;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao md;

	@Override
	public Member select(String member_id) {
		return md.select(member_id);
	}

	@Override
	public int insert(Member member) {
		
		return md.insert(member);
	}

	@Override
	public int checkHint(Member member) {
		return  md.checkHint(member);
	
	}

	@Override
	public int update(Member member) {
		return md.update(member);
	}



}
