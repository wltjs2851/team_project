package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.SearchDto;

@Repository
public class GroupBoardDaoImpl implements GroupBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.kh.team.mappers.groupboard.";

	@Override
	public boolean create(GroupBoardVo groupBoardVo) {
		System.out.println("groupBoardVo: " + groupBoardVo);
		int count = sqlSession.insert(NAMESPACE + "create", groupBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public GroupBoardVo read(int gbno) {
		GroupBoardVo groupBoardVo = sqlSession.selectOne(NAMESPACE + "read", gbno);
		return groupBoardVo;
	}

	@Override
	public boolean update(GroupBoardVo groupBoardVo) {
		int count = sqlSession.update(NAMESPACE + "update", groupBoardVo);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(int gbno) {
		int count = sqlSession.delete(NAMESPACE + "delete", gbno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<GroupBoardVo> list(SearchDto searchDto) {
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("gno", gno);
//		map.put("searchDto", searchDto);
		List<GroupBoardVo> groupList = sqlSession.selectList(NAMESPACE + "list", searchDto);
		System.out.println("map: " + map);
		System.out.println("Dao, groupList," + groupList);
		System.out.println("Dao, groupList, count:" + groupList.size());
		return groupList;
	}

	@Override
	public List<GroupBoardVo> notice(String gb_notice) {
		List<GroupBoardVo> noticeList = sqlSession.selectList(NAMESPACE + "notice", gb_notice);
		return noticeList;
	}

	@Override
	public int countComment(int gbno) {
		
		return sqlSession.selectOne(NAMESPACE + "countComment", gbno);
	}

	@Override
	public String getGb_picdById(int gbno) {
		String gb_pic = sqlSession.selectOne(NAMESPACE + "getGb_picById", gbno);
		return gb_pic;
	}

	@Override
	public List<GroupJoinVo> list(String userid) {
		List<GroupJoinVo> groupJoinList = sqlSession.selectList(NAMESPACE + "getGroupById", userid);
		return groupJoinList;
	}

	

	@Override
	public boolean deleteMember(String userid, int gno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("gno", gno);
		
		int count = sqlSession.delete(NAMESPACE + "deleteMember", map);
		if(count > 1) {
			return true;
		}
		return false;
	}

	@Override
	public void updateCtnMember(int gno) {
		sqlSession.update(NAMESPACE + "updateCntMember", gno);
	}

}
