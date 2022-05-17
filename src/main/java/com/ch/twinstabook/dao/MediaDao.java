package com.ch.twinstabook.dao;

import java.util.List;

import com.ch.twinstabook.model.Media;

public interface MediaDao {

	List<Media> list(int postno);

	void insertMedia(Media media2);

	List<Media> selectList(int postno);

}

