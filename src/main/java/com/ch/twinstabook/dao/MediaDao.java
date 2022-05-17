package com.ch.twinstabook.dao;

import java.util.List;

import com.ch.twinstabook.model.Media;

public interface MediaDao {

	void insertMedia(Media media2);

	List<Media> selectList(int postno);

	List<Media> list(int postno);


}
