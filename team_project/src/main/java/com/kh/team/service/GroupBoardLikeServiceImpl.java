package com.kh.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.GroupBoardLikeDao;
import com.kh.team.vo.GroupBoardLikeVo;

@Service
public class GroupBoardLikeServiceImpl implements GroupBoardLikeService {
	
	@Autowired
	private GroupBoardLikeDao groupBoardLikeDao;

	@Override
	public void addLike(GroupBoardLikeVo groupBoardLikeVo) {
		groupBoardLikeDao.addLike(groupBoardLikeVo);
		groupBoardLikeDao.updateLike(groupBoardLikeVo.getGbno());
	}

	@Override
	public void deleteLike(GroupBoardLikeVo groupBoardLikeVo) {
		groupBoardLikeDao.deleteLike(groupBoardLikeVo);
		groupBoardLikeDao.updateLike(groupBoardLikeVo.getGbno());
	}

	@Override
	public void updateLike(int gbno) {

	}

	@Override
	public int countLike(GroupBoardLikeVo groupBoardLikeVo) {
		return groupBoardLikeDao.countLike(groupBoardLikeVo);
	}

	@Override
	public boolean deleteAllLike(int gbno) {
		boolean result = groupBoardLikeDao.deleteAllLike(gbno);
		return result;
	}

}
