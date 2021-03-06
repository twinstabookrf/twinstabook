package com.ch.twinstabook.service;

import java.util.List;

import com.ch.twinstabook.model.Post;

public interface PostService {

	int insertPost(Post post);

	int getPostno();

	int update(Post post);

	Post select(int postno);

	List<Post> list(int startRow, int endRow);

	int delete(int postno);

	List<Post> postList(String member_id);

	int postTotal(String member_id);

	void updateRts(int postno);

	int rtUpdate(Post post);

}

