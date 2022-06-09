package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.GroupBoardVo;

public interface GroupBoardService {
	
	public boolean create(GroupBoardVo groupBoardVo);
	public GroupBoardVo read(int gbno);
	public boolean update(GroupBoardVo groupBoardVo);
	public boolean delete(int gbno);
	public List<GroupBoardVo> list();
	public List<GroupBoardVo> notice(String gb_notice);
	public boolean updateComment(int gbno);
	public int countComment(int gbno);

}
