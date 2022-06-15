package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.GroupDao;
import com.kh.team.service.GroupService;
import com.kh.team.vo.GroupVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class GroupDaoTest {
	
	@Autowired
	private GroupDao groupDao;
	
	@Autowired
	private GroupService groupService;
	
	@Test
	public void testGroupInsert() {
		GroupVo groupVo = new GroupVo("배구모임", "배구", 11, "배구가 짱", "서울", null, "hong1234");
		boolean result = groupDao.insertGroup(groupVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testGroupList() {
		List<GroupVo> list = groupDao.selectGroup();
		System.out.println("result: " + list);
	}
	
	@Test
	public void testGroupUpdate() {
		GroupVo groupVo = new GroupVo(1, "풋살로가자", "풋살", 5, "풋살임 ㅋ", "울산", null);
		boolean result = groupDao.updateGroup(groupVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testGroupDelete() {
		boolean result = groupDao.deleteGroup(1);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testGroupInsertService() {
		GroupVo groupVo = new GroupVo("족구모임", "족구", 11, "족구하쟈~~", "서울", null, "tuna11");
		boolean result = groupService.addGroup(groupVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testGroupJoinService() {
		GroupVo groupVo = new GroupVo(1, 1);
		boolean result = groupService.joinGroup(groupVo, "hong1234");
		System.out.println("result: " + result);
	}
	
}
