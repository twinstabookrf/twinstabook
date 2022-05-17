package com.ch.twinstabook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.twinstabook.dao.MemberDao;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao md;
}
