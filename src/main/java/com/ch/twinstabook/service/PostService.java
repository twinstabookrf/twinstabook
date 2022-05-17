package com.ch.twinstabook.service;

import java.util.List;

import com.ch.twinstabook.model.Post;

public interface PostService {

	int insertPost(Post post);

	int getPostno();

	List<Post> postList(Post post);

	int update(Post post);



}
