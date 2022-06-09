package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.FreeVo;

@Repository
public class FreeDaoImpl implements FreeDao{
	private final String NAMESPACE = "com.kh.team.mappers.free.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public boolean insertFreeArticle(FreeVo freeVo) {
		int count = sqlSession.insert(NAMESPACE + "insertFreeArticle", freeVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<FreeVo> selectFreeArticle() {
		List<FreeVo> list = sqlSession.selectList(NAMESPACE + "selectFreeArticle");
		return list;
	}

	@Override
	public boolean updateFreeArticle(FreeVo freeVo) {
		int count = sqlSession.update(NAMESPACE + "updateFreeArticle", freeVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteFreeArticle(int fno) {
		int count = sqlSession.delete(NAMESPACE + "deleteFreeArticle", fno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public FreeVo contentByFno(int fno) {
		FreeVo freeVo = sqlSession.selectOne(NAMESPACE + "contentByFno", fno);
		return freeVo;
	}

	@Override
	public void updateViewcnt(int fno, int f_viewcnt) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("fno", fno);
		parameter.put("f_viewcnt", f_viewcnt);
		sqlSession.update(NAMESPACE + "updateViewcnt", parameter);
		
	}

	@Override
	public List<FreeVo> categoryList() {
		List<FreeVo> list = sqlSession.selectList(NAMESPACE + "categoryList");
		return list;
	}

	@Override
	public List<FreeVo> selectByViewCnt() {
		List<FreeVo> list = sqlSession.selectList(NAMESPACE + "selectByViewCnt");
		return list;
	}

}
