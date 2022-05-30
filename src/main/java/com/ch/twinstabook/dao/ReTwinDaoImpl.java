package com.ch.twinstabook.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.twinstabook.model.ReTwin;

@Repository
public class ReTwinDaoImpl implements ReTwinDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public void insert(ReTwin reTwin2) {
		sst.insert("reTwinns.insert", reTwin2);
	}

	@Override
	public List<ReTwin> list(int postno) {
		return sst.selectList("reTwinns.list",postno);
	}

	@Override
	public int getReTwinno() {
		return sst.selectOne("reTwinns.getReTwinno");
	}

	@Override
	public int delete(int postno) {
		return sst.delete("reTwinns.delete", postno);
	}

	@Override
	public List<ReTwin> selectList(int postno) {
		return sst.selectList("reTwinns.selectList", postno);
	}

	@Override
	public ReTwin selectReTwinno(int reTwinno) {
		return sst.selectOne("reTwinns.selectReTwinno", reTwinno);
	}

	@Override
	public int update(ReTwin reTwin) {
		return sst.update("reTwinns.update", reTwin);
	}

	
}
