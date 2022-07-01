package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.FreeCommentDao;
import com.kh.team.dao.FreeDao;
import com.kh.team.vo.FreeVo;
import com.kh.team.vo.PagingDto;

@Service
public class FreeServiceImpl implements FreeService{
	
	@Autowired
	FreeDao freeDao;
	
	@Autowired
	FreeCommentDao freeDaoComment;

	@Override
	public boolean addFree(FreeVo freeVo) {
		return freeDao.insertFreeArticle(freeVo);
	}

	@Override
	public List<FreeVo> freeList(PagingDto pagingDto) {
		return freeDao.selectFreeArticle(pagingDto);
	}

	@Override
	public boolean modifyFree(FreeVo freeVo) {
		return freeDao.updateFreeArticle(freeVo);
	}

	@Override
	@Transactional
	public boolean removeFree(int fno) {
		boolean deleteComment = freeDaoComment.deleteFreeCommentAll(fno);
		boolean deleteLike = freeDao.deleteLikeAll(fno);
		boolean deleteArticle = freeDao.deleteFreeArticle(fno);
		if(deleteComment && deleteLike && deleteArticle) {
			return true;
		}
		return false;
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

	@Override
	public int countLike(int fno, String nickname) {
		return freeDao.countLike(fno, nickname);
	}

	@Override
	@Transactional
	public boolean decreaseLike(int fno, int f_like, String nickname) {
		boolean resultDelete = freeDao.deleteLike(fno, nickname);
		boolean resultUpdate = freeDao.updateLikecnt(fno, f_like - 1);
		if(resultDelete && resultUpdate) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean increaseLike(int fno, int f_like, String nickname) {
		boolean resultInsert = freeDao.insertLike(fno, nickname);
		boolean resultUpdate = freeDao.updateLikecnt(fno, f_like + 1);
		if(resultInsert && resultUpdate) {
			return false;
		}
		return true;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		return freeDao.getCount(pagingDto);
	}

	@Override
	public List<FreeVo> adminFreeList(String nickname) {
		return freeDao.adminFreeList(nickname);
	}
	
}
