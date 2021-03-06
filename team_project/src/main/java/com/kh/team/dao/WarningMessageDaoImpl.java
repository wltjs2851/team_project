package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.WarningMessageVo;

@Repository
public class WarningMessageDaoImpl implements WarningMessageDao{
	
	@Autowired
	private SqlSession sqlSession; 
	
	private final String NAMESPACE ="com.kh.team.mappers.warning.";

	@Override
	public boolean insertWarningMessage(WarningMessageVo warningMessageVo) {
		int count = sqlSession.insert(NAMESPACE + "insertWarningMessage", warningMessageVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<WarningMessageVo> listWarningMessage(String nickname) {
		List<WarningMessageVo> listWarningMessage = sqlSession.selectList(NAMESPACE + "listWarningMessage", nickname);
		return listWarningMessage;
	}

	@Override
	public int warningCount(String nickname) {
		int count = sqlSession.selectOne(NAMESPACE + "warningMessageCount", nickname);
		return count;
	}

}
