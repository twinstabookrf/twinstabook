package com.ch.twinstabook.service;

import java.util.List;

import com.ch.twinstabook.model.ReTwin;

public interface ReTwinService {

	void insert(List<ReTwin> reTwin);

	List<ReTwin> list(int postno);

	int getReTwinno();

	int delete(int postno);

	List<ReTwin> selectList(int postno);

	ReTwin selectReTwinno(int reTwinno);

	int update(ReTwin reTwin);

}
