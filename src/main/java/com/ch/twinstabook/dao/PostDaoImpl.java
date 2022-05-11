package com.ch.twinstabook.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostDaoImpl implements PostDao{
	@Autowired
	private SqlSessionTemplate sst;
}
