package com.kh.team.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.dao.AdminDao;
import com.kh.team.dao.GroupBoardDao;
import com.kh.team.dao.GroupDao;
import com.kh.team.dao.MemberDao;
import com.kh.team.dao.ReportBoardDao;
import com.kh.team.vo.AdminVo;
import com.kh.team.vo.testVo;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private GroupDao groupDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ReportBoardDao reportBoardDao;
	
	@Override
	public List<AdminVo> adminList(String userid) {
		return adminDao.adminList(userid);
	}
	@Override
	public List<testVo> getGroupInfo() {
		return adminDao.getGroupInfo();
	}
	
	@Override
	@Transactional
	public boolean userOut(String userid) {
		List<Integer> gnoList = adminDao.getGno(userid);
		System.out.println("gnoList:" + gnoList);
		List<String> memberList = new ArrayList<String>();
		if(gnoList.size() > 0) {
			for(int i = 0; i < gnoList.size(); i++) {
				System.out.println("1");
				memberList = adminDao.getGmember(gnoList.get(i));
				for(int j = 0; j < memberList.size(); j++) {
					if(memberList.size() > 1 && !memberList.get(j).equals(userid)) {
						System.out.println("2");
						System.out.println(memberList.get(j));
						adminDao.updateGLeader(gnoList.get(i), memberList.get(j));
						groupDao.updateGroupMember(gnoList.get(i), -1);
						groupDao.deleteJoinGroup(gnoList.get(i), userid);
						memberDao.deleteMember(userid);
						break;
					}
					if(memberList.size() == 1 && memberList.get(j).equals(userid)) {
						// 그룹에 본인만 있는 경우 
						System.out.println("3");
						System.out.println(memberList.get(j));
						groupDao.deleteJoinGroup(gnoList.get(i), memberList.get(j));
						groupDao.deleteGroup(gnoList.get(i));
						memberDao.deleteMember(memberList.get(j));
						break;
					}
				}
			}
			return true;
		} else {
			return false;
		}
	}

}
