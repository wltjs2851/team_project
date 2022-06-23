package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.AdminVo;
import com.kh.team.vo.testVo;

@Repository
public class AdminDaoImpl implements AdminDao{
	
private final String NAMESPACE = "com.kh.team.mappers.admin.";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<AdminVo> adminList(String userid) {
		List<AdminVo> adminList = sqlSession.selectList(NAMESPACE + "adminList", userid);
		return adminList;
	}

	@Override
	public List<testVo> getGroupInfo() {
		List<testVo> getGroupInfo = sqlSession.selectList(NAMESPACE + "getGroupInfo");
		return getGroupInfo;
	}

}
