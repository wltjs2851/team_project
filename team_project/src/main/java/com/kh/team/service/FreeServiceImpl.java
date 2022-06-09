package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.FreeDao;
import com.kh.team.vo.FreeVo;

@Service
public class FreeServiceImpl implements FreeService{
	
	@Autowired
	FreeDao freeDao;

	@Override
	public boolean addFree(FreeVo freeVo) {
		return freeDao.insertFreeArticle(freeVo);
	}

	@Override
	public List<FreeVo> freeList() {
		return freeDao.selectFreeArticle();
	}

	@Override
	public boolean modifyFree(FreeVo freeVo) {
		return freeDao.updateFreeArticle(freeVo);
	}

	@Override
	public boolean removeFree(int fno) {
		return freeDao.deleteFreeArticle(fno);
	}

	@Override
	public FreeVo contentByFno(int fno) {
		return freeDao.contentByFno(fno);
	}

	@Override
	public void updateViewcnt(int fno, int f_viewcnt) {
		freeDao.updateViewcnt(fno, f_viewcnt);
	}

	@Override
	public List<FreeVo> categoryList() {
		return freeDao.categoryList();
	}

	@Override
	public List<FreeVo> selectByViewCnt() {
		return freeDao.selectByViewCnt();
	}
	
}
