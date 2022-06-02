package com.kh.team.group;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.vo.GroupBoardVo;

@Service
public class GroupBoardServiceImpl implements GroupBoardService {
	
	@Autowired
	private GroupBoardDao groupDao;

	@Override
	public boolean create(GroupBoardVo groupBoardVo) {
		
		return false;
	}

	@Override
	public GroupBoardVo read(int gbno) {
		GroupBoardVo groupVo = groupDao.read(gbno);
		return groupVo;
	}

	@Override
	public boolean update(GroupBoardVo groupBoardVo) {
		boolean result = groupDao.update(groupBoardVo);
		return result;
	}

	@Override
	public boolean delete(int gbno) {
		boolean result = groupDao.delete(gbno);
		return result;
	}

	@Override
	public List<GroupBoardVo> list() {
		List<GroupBoardVo> groupList = groupDao.list();
		return groupList;
	}

}
