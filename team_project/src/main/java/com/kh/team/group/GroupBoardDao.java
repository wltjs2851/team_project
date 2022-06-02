package com.kh.team.group;

import java.util.List;

import com.kh.team.vo.GroupBoardVo;

public interface GroupBoardDao {
	
	public boolean create(GroupBoardVo groupBoardVo);
	public GroupBoardVo read(int gbno);
	public boolean update(GroupBoardVo groupBoardVo);
	public boolean delete(int gbno);
	public List<GroupBoardVo> list();

}
