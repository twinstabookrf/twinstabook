
package com.ch.twinstabook.service;

import java.util.List;

import com.ch.twinstabook.model.Media;

public interface MediaService {

	void insertMedia(List<Media> media);

	List<Media> list(int postno);

	void update(List<Media> media);

	int delete(int postno);

}
