package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.RoutineCommentDao;
import com.kh.team.dao.RoutineDao;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.RoutineVo;

@Service
public class RoutineServieImpl implements RoutineService{
	
	@Autowired 
	private RoutineDao routineDao;
	
	@Autowired
	private RoutineCommentDao routineCommentDao;

	@Override
	public boolean addRoutine(RoutineVo routineVo) {
		return routineDao.insertRoutine(routineVo);
	}

	@Override
	public List<RoutineVo> routineList(PagingDto pagingDto) {
		return routineDao.selectRoutine(pagingDto);
	}

	@Override
	public boolean modifyRoutine(RoutineVo routineVo) {
		return routineDao.updateRoutine(routineVo);
	}

	@Override
	@Transactional
	public boolean removeRoutine(int uno) {
		boolean commentDelete = routineCommentDao.deleteRoutineCommentAll(uno);
		boolean likeDelete = routineDao.deleteLikeAll(uno);
		boolean contentDelete = routineDao.deleteRoutine(uno);
		if(contentDelete && commentDelete && likeDelete) {
			return true;
		}
		return false;
	}

	@Override
	public RoutineVo contentByUno(int uno) {
		return routineDao.contentByUno(uno);
	}

	@Override
	public void updateViewcnt(int uno, int ur_viewcnt) {
		routineDao.updateViewcnt(uno, ur_viewcnt);
	}

	@Override
	public List<RoutineVo> selectByViewCnt() {
		return routineDao.selectByViewCnt();
	}

	@Override
	public int isLike(int uno, String userid) {
		return routineDao.countLike(uno, userid);
	}

	@Override
	@Transactional
	public boolean decreaseLike(int uno, int ur_like, String userid) {
		boolean resultDelete = routineDao.deleteLike(uno, userid);
		boolean resultUpdate = routineDao.updateLikecnt(uno, ur_like - 1);
		if(resultDelete && resultUpdate) {
			return true;
		}
		return false;
	}

	@Override
	@Transactional
	public boolean increaseLike(int uno, int ur_like, String userid) {
		boolean resultInsert = routineDao.insertLike(uno, userid);
		boolean resultUpdate = routineDao.updateLikecnt(uno, ur_like + 1);
		if(resultInsert && resultUpdate) {
			return false;
		}
		return true;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		return routineDao.getCount(pagingDto);
	}

}
