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
	public int update(Post post) {
		return pd.update(post);
	}

	@Override
	public Post select(int postno) {
		return pd.select(postno);
	}

	@Override
	public List<Post> list(int startRow, int endRow) {
		return pd.list(startRow, endRow);
	}

	@Override
	public int delete(int postno) {
		return pd.delete(postno);
	}

	@Override
	public List<Post> postList(String member_id) {
		return pd.postList(member_id);
	}

	@Override
	public int postTotal(String member_id) {
		return pd.postTotal(member_id);
	}

	@Override
	public void updateRts(int postno) {
		pd.updateRts(postno);
	}

	@Override
	public int rtUpdate(Post post) {
		return pd.rtUpdate(post);
	}


}

