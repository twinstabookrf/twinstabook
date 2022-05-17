<<<<<<< HEAD
package com.ch.twinstabook.service;

import java.util.List;

import com.ch.twinstabook.model.Post;

public interface PostService {

	List<Post> list(int startRow, int endRow);

	int insertPost(Post post);

	int getPostno();
	
	int update(Post post);

	Post select(int postno);
}
=======
package com.ch.twinstabook.service;

import java.util.List;

import com.ch.twinstabook.model.Post;

public interface PostService {

	int insertPost(Post post);

	int getPostno();

	List<Post> postList(Post post);

	int update(Post post);



}
>>>>>>> branch 'master' of https://github.com/twinstabookrf/twinstabook
