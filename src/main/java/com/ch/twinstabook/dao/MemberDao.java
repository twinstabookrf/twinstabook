package com.ch.twinstabook.dao;

import java.util.List;

import com.ch.twinstabook.model.Member;
public interface MemberDao {

	Member select(String member_id);

	int insert(Member member);

	int checkHint(Member member);

	int update(Member member);

	int updateAll(Member member);

	int delete(String member_id);

	List<Member> selectAll();

	Member selectName(String name);

	
}

