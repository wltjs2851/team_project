package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.SearchDto;

public interface GroupBoardDao {
	
	public boolean create(GroupBoardVo groupBoardVo);
	public GroupBoardVo read(int gbno);
	public boolean update(GroupBoardVo groupBoardVo);
	public boolean delete(int gbno);
	public List<GroupBoardVo> list(int gno);
//	public List<GroupBoardVo> list(SearchDto searchDto);
	public List<GroupBoardVo> notice(String gb_notice);
//	public boolean updateComment(int gbno);
	public int countComment(int gbno);
	public String getGb_picdById(int gbno);

}
