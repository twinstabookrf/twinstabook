package com.ch.twinstabook.dao;

import java.util.List;

import com.ch.twinstabook.model.ReTwin;

public interface ReTwinDao {

	void insert(ReTwin reTwin2);

	List<ReTwin> list(int postno);

	int getReTwinno();

	int delete(int postno);

	List<ReTwin> selectList(int postno);

	ReTwin selectReTwinno(int reTwinno);

	int update(ReTwin reTwin);

}
