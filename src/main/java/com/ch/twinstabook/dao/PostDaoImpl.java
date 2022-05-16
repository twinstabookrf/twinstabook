package com.ch.twinstabook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.twinstabook.model.Post;

@Repository
public class PostDaoImpl implements PostDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insertPost(Post post) {
		return sst.insert("postns.insertPost", post);
	}

	@Override
	public int getPostno() {
		return sst.selectOne("postns.getPostno");
	}

	@Override
	public List<Post> postList(Post post) {
		return sst.selectList("postns.postList", post);
	}


}
