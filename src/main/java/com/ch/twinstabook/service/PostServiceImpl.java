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
	public List<Post> list(int startRow, int endRow) {
		return pd.list(startRow, endRow);
	}
}
