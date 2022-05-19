package com.ch.twinstabook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.twinstabook.model.Media;

@Repository
public class MediaDaoImpl implements MediaDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public List<Media> list(int postno) {
		return sst.selectList("medians.list",postno);
	}

	@Override
	public void insertMedia(Media media2) {
		sst.insert("medians.insertMedia", media2);
	}

	@Override
	public void update(Media media2) {
		sst.update("medians.update", media2);
	}

	@Override
	public int delete(int postno) {
		return sst.delete("medians.delete", postno);
	}

}
