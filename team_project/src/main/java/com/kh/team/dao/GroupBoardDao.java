package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.SearchDto;

public interface GroupBoardDao {
	
	public boolean create(GroupBoardVo groupBoardVo);
	public GroupBoardVo read(int gbno);
	public boolean update(GroupBoardVo groupBoardVo);
	public boolean delete(int gbno);
	public List<GroupBoardVo> list(SearchDto searchDto);
//	public List<GroupBoardVo> list(SearchDto searchDto);
	public List<GroupBoardVo> notice(String gb_notice);
//	public void updateComment(int gbno);
	public int countComment(int gbno);
	public String getGb_picdById(int gbno);
//	public String getGroupById(String userid);
	public boolean updateGLeader(GroupVo groupVo);
	public void pickGLeader(int gno);
	
	public boolean deleteMember(String userid, int gno);
	public void updateCtnMember(int gno);

}
