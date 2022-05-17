package com.ch.twinstabook.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.twinstabook.model.Post;

@Repository
public class PostDaoImpl implements PostDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Post> list(int startRow, int endRow) {
		Map<String,Integer > param = new HashMap<>();
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		return sst.selectList("postns.list",param);
	}
	@Override
	public int insertPost(Post post) {
		return sst.insert("postns.insertPost", post);
	}

	@Override
	public int getPostno() {
		return sst.selectOne("postns.getPostno");
	}
	@Override
	public int update(Post post) {
		return sst.update("postns.update", post);
	}
	@Override
	public Post select(int postno) {
		return sst.selectOne("postns.select", postno);
	}
}
