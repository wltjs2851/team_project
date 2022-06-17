package com.kh.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.KcalVo;
import com.kh.team.vo.PagingDto;

@Repository
public class KcalDaoImple implements KcalDao{

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE ="com.kh.team.mappers.kcal.";
	
	@Override
	public boolean insertKcal(KcalVo kcalVo) {
		int count = sqlSession.insert(NAMESPACE + "insertKcal", kcalVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateKcal(KcalVo kcalVo) {
		int count = sqlSession.update(NAMESPACE + "updateKcal", kcalVo);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteKcal(int kno) {
		int count = sqlSession.delete(NAMESPACE + "deleteKcal", kno);
		if (count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public KcalVo selectByKno(int kno) {
		KcalVo kcalVo = sqlSession.selectOne(NAMESPACE + "selectByKno", kno);
		return kcalVo;
	}

//	@Override
//	public List<KcalVo> listKcal() {
//		List<KcalVo> listKcal = sqlSession.selectList(NAMESPACE + "listKcal");
//		return listKcal;
//	}

	@Override
	public List<KcalVo> listKcal(PagingDto pagingDto) {
		List<KcalVo> listKcal = sqlSession.selectList(NAMESPACE + "listKcal", pagingDto);
		return listKcal;
	}

	@Override
	public int getCountKcal(PagingDto pagingDto) {
		int count = sqlSession.selectOne(NAMESPACE + "getCountKcal", pagingDto);
		return count;
	}

	@Override
	public String getK_picByKno(int kno) {
		String k_pic = sqlSession.selectOne(NAMESPACE + "getK_picByKno", kno);
		return k_pic;
	}

}
