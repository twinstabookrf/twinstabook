package com.ch.twinstabook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.twinstabook.dao.ReTwinDao;
import com.ch.twinstabook.model.Media;
import com.ch.twinstabook.model.ReTwin;

@Service
public class ReTwinServiceImpl implements ReTwinService{
	@Autowired
	private ReTwinDao rtd;

	@Override
	public void insert(List<ReTwin> reTwin) {
		for (ReTwin reTwin2 : reTwin) {
			rtd.insert(reTwin2);
		}
	}

	@Override
	public List<ReTwin> list(int postno) {
		return rtd.list(postno);
	}

	@Override
	public int getReTwinno() {
		return rtd.getReTwinno();
	}

	@Override
	public int delete(int postno) {
		return rtd.delete(postno);
	}

	@Override
	public List<ReTwin> selectList(int postno) {
		return rtd.selectList(postno);
	}

	@Override
	public ReTwin selectReTwinno(int reTwinno) {
		return rtd.selectReTwinno(reTwinno);
	}

	@Override
	public int update(ReTwin reTwin) {
		return rtd.update(reTwin);
	}

	
}
