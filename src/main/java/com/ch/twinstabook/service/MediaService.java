
package com.ch.twinstabook.service;

import java.util.List;

import com.ch.twinstabook.model.Media;

public interface MediaService {

	void insertMedia(List<Media> media);

	List<Media> selectList(int postno);

	List<Media> list(int postno);

}
