package com.ch.twinstabook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.twinstabook.dao.PostDao;
import com.ch.twinstabook.model.Post;

@Service
public class PostServiceImpl implements PostService{
	@Autowired
	private PostDao pd;


	@Override
	public int insertPost(Post post) {
		return pd.insertPost(post);
	}

	@Override
	public int getPostno() {
		return pd.getPostno();
	}
	
	@Override
	public List<Post> postList(Post post) {
		return pd.postList(post);
	}

	@Override
	public int update(Post post) {
		return pd.update(post);
	}



}
