package com.kh.team.group;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupDaoImpl implements GroupDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean create(GroupVo groupVo) {
		
		return false;
	}

	@Override
	public GroupVo read(int gno) {
		
		return null;
	}

	@Override
	public boolean update(GroupVo groupVo) {
		
		return false;
	}

	@Override
	public boolean delete(int gno) {
		
		return false;
	}

	@Override
	public List<GroupVo> list() {
		
		return null;
	}

}
