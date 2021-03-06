package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.LocationVo;
import com.kh.team.vo.PagingDto;

@Repository
public class GroupDaoImpl implements GroupDao{
	
	private final String NAMESPACE = "com.kh.team.mappers.group.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertGroup(GroupVo groupVo) {
		int count = sqlSession.insert(NAMESPACE + "insertGroup", groupVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<GroupVo> selectGroup() {
		List<GroupVo> list = sqlSession.selectList(NAMESPACE + "selectGroup");
		return list;
	}

	@Override
	public boolean updateGroup(GroupVo groupVo) {
		int count = sqlSession.update(NAMESPACE + "updateGroup", groupVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteGroup(int gno) {
		int count = sqlSession.delete(NAMESPACE + "deleteGroup", gno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public GroupVo groupByGno(int gno) {
		GroupVo groupVo = sqlSession.selectOne(NAMESPACE + "groupByGno", gno);
		return groupVo;
	}

	@Override
	public boolean updateGroupMember(int gno, int cnt) {
		Map<String, Integer> parameter = new HashMap<>();
		parameter.put("gno", gno);
		parameter.put("cnt", cnt);
		int count = sqlSession.update(NAMESPACE + "updateGroupMember", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int getNextGno() {
		int gno = sqlSession.selectOne(NAMESPACE + "getNextGno");
		return gno;
	}

	@Override
	public boolean insertJoinGroup(int gno, String userid, String nickname) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("gno", gno);
		parameter.put("userid", userid);
		parameter.put("nickname", nickname);
		System.out.println(parameter);
		int count = sqlSession.insert(NAMESPACE + "insertJoinGroup", parameter);
		if(count > 0) {
			return true;
		}
		return false;
	}
	
	public boolean deleteJoinGroup(int gno, String userid) {
		Map<String, Object> map = new HashMap<>();
		map.put("gno", gno);
		map.put("userid", userid);
		int count = sqlSession.insert(NAMESPACE + "deleteJoinGroup", map);
		if (count > 0) { 
			return true;
		} 
		return false;
		
	}
	
	@Override
	public List<GroupJoinVo> list(int gno) {
		List<GroupJoinVo> groupJoinMember = sqlSession.selectList(NAMESPACE + "getGroupMember", gno);
		return groupJoinMember;
	}

	@Override
	public List<GroupJoinVo> list(String userid) {
		List<GroupJoinVo> groupJoinList = sqlSession.selectList(NAMESPACE + "getGroupById", userid);
		return groupJoinList;
	}

	@Override
	public List<GroupVo> groupListOrder() {
		return sqlSession.selectList(NAMESPACE + "groupListOrder");
	}

	@Override
	public List<String> getNickname(int gno) {
		List<String> nickname = sqlSession.selectList(NAMESPACE + "getNickname", gno);
		return nickname;
	}

	@Override
	public List<LocationVo> groupLocation() {
		List<LocationVo> location = sqlSession.selectList(NAMESPACE + "groupLocation");
		return location;
	}

	@Override
	public List<LocationVo> groupLocationSno(int dno) {
		List<LocationVo> location = sqlSession.selectList(NAMESPACE + "groupLocationSno", dno);
		return location;
	}

	@Override
	public List<LocationVo> groupLocationSgno(int dno, int sno) {
		Map<String, Integer> parameter = new HashMap<>();
		parameter.put("dno", dno);
		parameter.put("sno", sno);
		List<LocationVo> location = sqlSession.selectList(NAMESPACE + "groupLocationSgno", parameter);
		return location;
	}

	@Override
	public List<GroupVo> groupByLocation(int dno) {
		return sqlSession.selectList(NAMESPACE + "groupByLocation", dno);
	}

	@Override
	public List<GroupVo> searchLocation(LocationVo locationVo) {
		return sqlSession.selectList(NAMESPACE + "searchLocation", locationVo);
	}
	
	@Override
	public List<GroupVo> selectGroupList(int startRow, int endRow) {
		Map<String, Integer> parameter = new HashMap<>();
		parameter.put("startRow", startRow);
		parameter.put("endRow", endRow);
		List<GroupVo> list = sqlSession.selectList(NAMESPACE + "selectGroupList", parameter);
		return list;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
		return count;
	}

	@Override
	public List<GroupVo> getGroupByUserId(String userid) {
		List<GroupVo> groupList = sqlSession.selectList(NAMESPACE + "getGroupByUserId", userid);
		return groupList;
	}

	@Override
	public List<GroupVo> adminGroupList(PagingDto pagingDto) {
		List<GroupVo> adminGroupList = sqlSession.selectList(NAMESPACE + "adminGroupList", pagingDto);
		return adminGroupList;
	}
	
	@Override
	public boolean deleteGroupBoard(int gno) {
		int count = sqlSession.delete(NAMESPACE + "deleteGroupBoard", gno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteGroupComment(int gno) {
		int count = sqlSession.delete(NAMESPACE + "deleteGroupComment", gno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteGroupLike(int gno) {
		int count = sqlSession.delete(NAMESPACE + "deleteGroupLike", gno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteGroupReport(int gno) {
		int count = sqlSession.delete(NAMESPACE + "deleteGroupReport", gno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteGroupCalendar(int gno) {
		int count = sqlSession.delete(NAMESPACE + "deleteGroupCalendar", gno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public int isExistMyGroupList(String userid) {
		return sqlSession.selectOne(NAMESPACE + "isExistMyGroupList", userid);
	}

	@Override
	public boolean deleteJoinGroupNickname(int gno, String nickname) {
		Map<String, Object> map = new HashMap<>();
		map.put("gno", gno);
		map.put("nickname", nickname);
		int count = sqlSession.insert(NAMESPACE + "deleteJoinGroupNickname", map);
		if (count > 0) { 
			return true;
		} 
		return false;
	}
}
