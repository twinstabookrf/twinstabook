
package com.ch.twinstabook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.twinstabook.dao.MediaDao;
import com.ch.twinstabook.model.Media;

@Service
public class MediaServiceImpl implements MediaService{
	@Autowired
	private MediaDao md;

	@Override
	public void insertMedia(List<Media> media) {
		for (Media media2 : media) {
			md.insertMedia(media2);
		}
	}

	@Override
	public List<Media> list(int postno) {
		return md.list(postno);
	}

	@Override
	public void update(List<Media> media) {
		for (Media media2 : media) {
			md.update(media2);
		}
	}

	@Override
	public int delete(int postno) {
		return md.delete(postno);
	}


}

