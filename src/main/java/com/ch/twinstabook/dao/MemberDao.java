package com.ch.twinstabook.dao;

import com.ch.twinstabook.model.Member;
public interface MemberDao {

	Member select(String member_id);

	int insert(Member member);
	}
