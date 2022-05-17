package com.ch.twinstabook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ch.twinstabook.dao.MediaDao;
import com.ch.twinstabook.model.Media;

@Service
public class MedaiServiceImpl implements MedaiService{
	@Autowired
	private MediaDao md;

	@Override
	public List<Media> list(int postno) {
		return md.list(postno);
	}
}
