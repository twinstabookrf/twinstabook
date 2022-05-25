package com.ch.twinstabook.dao;

import java.util.List;

import com.ch.twinstabook.model.Post;

public interface PostDao {

	int insertPost(Post post);
	
	int getPostno();

	int update(Post post);

	Post select(int postno);

	List<Post> list(int startRow, int endRow);

	int delete(int postno);

	List<Post> postList(String member_id);

	int postTotal(String member_id);

	void updateRts(int postno);
	
}

