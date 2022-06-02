package com.kh.team.group;

import java.util.List;

public interface GroupDao {
	
	public boolean create(GroupVo groupVo);
	public GroupVo read(int gno);
	public boolean update(GroupVo groupVo);
	public boolean delete(int gno);
	public List<GroupVo> list();

}
