package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.GroupJoinVo;
import com.kh.team.vo.GroupVo;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.ReportVo;

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
	public List<GroupBoardVo> list(PagingDto pagingDto) {
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("gno", gno);
//		map.put("searchDto", searchDto);
		List<GroupBoardVo> groupList = sqlSession.selectList(NAMESPACE + "list", pagingDto);
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
	public boolean deleteMember(String nickname, int gno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nickname", nickname);
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

	@Override
	public boolean updateGLeader(GroupVo groupVo) {
		int count = sqlSession.update(NAMESPACE + "updateGLeader", groupVo);
		if(count > 1) {
			return true;
		}
		return false;
	}

	@Override
	public MemberVo pickGroupMember(String nickname) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "pickGroupMember", nickname);
		return memberVo;
	}

	@Override
	public List<GroupBoardVo> adminGroupBoardList(String nickname) {
		List<GroupBoardVo> adminGroupBoardList = sqlSession.selectList(NAMESPACE + "adminGroupBoardList", nickname);
		return adminGroupBoardList;
	}

	@Override
	public int getCount(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCount", pagingDto);
		return count;
	}

	@Override
	public int getCountMain(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountMain", pagingDto);
		System.out.println("groupBoardDao, count: " + count);
		return count;
	}

}
