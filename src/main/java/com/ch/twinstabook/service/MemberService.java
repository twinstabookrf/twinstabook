package com.ch.twinstabook.service;

import com.ch.twinstabook.model.Member;

public interface MemberService {

	Member select(String member_id);

	int insert(Member member);

	int checkHint(Member member);

	int update(Member member);

	int updateAll(Member member);

	int delete(String member_id);


	}
