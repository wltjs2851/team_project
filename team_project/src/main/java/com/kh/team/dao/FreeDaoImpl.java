package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.FreeVo;
import com.kh.team.vo.PagingDto;

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
	public List<FreeVo> selectFreeArticle(PagingDto pagingDto) {
		List<FreeVo> list = sqlSession.selectList(NAMESPACE + "selectFreeArticle", pagingDto);
		System.out.println("selectFreeArticle:" + list);
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

	@Override
	public boolean insertLike(int fno, String userid) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("fno", fno);
		parameter.put("userid", userid);
		int count = sqlSession.insert(NAMESPACE + "insertLike", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteLike(int fno, String userid) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("fno", fno);
		parameter.put("userid", userid);
		int count = sqlSession.delete(NAMESPACE + "deleteLike", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int countLike(int fno, String userid) {
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("fno", fno);
		parameter.put("userid", userid);
		int count = sqlSession.selectOne(NAMESPACE + "countLike", parameter);
		return count;
	}

	@Override
	public boolean updateLikecnt(int fno, int f_like) {
		Map<String, Integer> parameter = new HashMap<>();
		parameter.put("fno", fno);
		parameter.put("f_like", f_like);
		int count = sqlSession.update(NAMESPACE + "updateLikecnt", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
		return count;
	}

	@Override
	public boolean deleteLikeAll(int fno) {
		int count = sqlSession.delete(NAMESPACE + "deleteLikeAll", fno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<FreeVo> adminFreeList(String userid) {
		List<FreeVo> adminFreeList = sqlSession.selectList(NAMESPACE + "adminFreeList", userid);
		return adminFreeList;
	}

}
