package com.kh.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.team.dao.KcalDao;
import com.kh.team.vo.KcalVo;
import com.kh.team.vo.PagingDto;

@Service
public class KcalServiceImpl implements KcalService{
	
	@Autowired
	private KcalDao kcalDao;
	
	@Override
	public boolean insertKcal(KcalVo kcalVo) {
		boolean result = kcalDao.insertKcal(kcalVo);
		return result;
	}

	@Override
	public boolean updateKcal(KcalVo kcalVo) {
		boolean result = kcalDao.updateKcal(kcalVo);
		return result;
	}

	@Override
	public boolean deleteKcal(int kno) {
		boolean result = kcalDao.deleteKcal(kno);
		return result;
	}

	@Override
	public KcalVo selectByKno(int kno) {
		KcalVo kcalVo = kcalDao.selectByKno(kno);
		return kcalVo;
	}

//	@Override
//	public List<KcalVo> listKcal() {
//		List<KcalVo> listKcal= kcalDao.listKcal();
//		return listKcal;
//	}

	@Override
	public List<KcalVo> listKcal(PagingDto pagingDto) {
		return kcalDao.listKcal(pagingDto);
		
	}

	@Override
	public int getCountKcal(PagingDto pagingDto) {
		return kcalDao.getCountKcal(pagingDto);
	}

	@Override
	public String getK_picByKno(int kno) {
		return kcalDao.getK_picByKno(kno);
	}

}
