package com.ch.twinstabook.dao;

import java.util.List;

import com.ch.twinstabook.model.Post;

public interface PostDao {

	int insertPost(Post post);

	int getPostno();

	List<Post> postList(Post post);

}
