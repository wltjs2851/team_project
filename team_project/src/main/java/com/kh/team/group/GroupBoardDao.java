package com.kh.team.group;

import java.util.List;

public interface GroupBoardDao {
	
	public boolean create(GroupBoardVo groupVo);
	public GroupBoardVo read(int gbno);
	public boolean update(GroupBoardVo groupVo);
	public boolean delete(int gbno);
	public List<GroupBoardVo> list();

}
