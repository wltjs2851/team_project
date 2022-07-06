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
	public List<AdminVo> adminList(String nickname) {
		return adminDao.adminList(nickname);
	}
	@Override
	public List<testVo> getGroupInfo() {
		return adminDao.getGroupInfo();
	}
	
	@Override
	@Transactional
	public boolean userOut(String nickname) {
		List<Integer> gnoList = adminDao.getGno(nickname);
		System.out.println("gnoList:" + gnoList);
		List<String> memberList = new ArrayList<String>();
		List<String> userList = new ArrayList<String>();
		if(gnoList.size() > 0) {
			for(int i = 0; i < gnoList.size(); i++) {
				System.out.println("1");
				memberList = adminDao.getGmember(gnoList.get(i));
				userList = adminDao.getGuser(gnoList.get(i));
				for(int j = 0; j < memberList.size(); j++) {
					if(memberList.size() > 1 && !memberList.get(j).equals(nickname)) {
						System.out.println("2");
						System.out.println("admin " + memberList.get(j));
						System.out.println("admin " + userList.get(j));
						adminDao.updateGLeader(gnoList.get(i), userList.get(j));
						groupDao.updateGroupMember(gnoList.get(i), -1);
						groupDao.deleteJoinGroupNickname(gnoList.get(i), nickname);
						memberDao.deleteMember(nickname);
						break;
					}
					if(memberList.size() == 1 && memberList.get(j).equals(nickname)) {
						// 그룹에 본인만 있는 경우 
						System.out.println("3");
						System.out.println(memberList.get(j));
						groupDao.deleteJoinGroupNickname(gnoList.get(i), nickname);
						groupDao.deleteGroup(gnoList.get(i));
						memberDao.deleteMember(memberList.get(j));
						break;
					}
				}
			}
			memberDao.deleteMember(nickname);
			return true;
		} else {
			memberDao.deleteMemberNickname(nickname);
			return true;
		}
	}

}
