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
		for(int i = 1; i < 41; i++) {
			GroupVo groupVo = new GroupVo("모임" + i, "물놀이", 7, "모임이지롱~" + i, "admin01",null, 8, 0, 0);			
			boolean result = groupDao.insertGroup(groupVo);
			System.out.println("result: " + result);
		}
	}
	
	@Test
	public void testGroupList() {
		List<GroupVo> list = groupDao.selectGroupList(0,5);
		System.out.println("result: " + list);
	}
	
//	@Test
//	public void testGroupUpdate() {
//		GroupVo groupVo = new GroupVo(1, "풋살로가자", "풋살", 5, "풋살임 ㅋ", "울산", null);
//		boolean result = groupDao.updateGroup(groupVo);
//		System.out.println("result: " + result);
//	}
	
	@Test
	public void testGroupDelete() {
		boolean result = groupDao.deleteGroup(1);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testGroupInsertService() {
		for(int i = 1; i < 41; i++) {
			GroupVo groupVo = new GroupVo("모임" + i, "물놀이", 7, "모임이지롱~" + i, "admin01",null, 8, 0, 0);			
			boolean result = groupDao.insertGroup(groupVo);
			System.out.println("result: " + result);
		}
	}
	
	@Test
	public void testGroupJoinService() {
		boolean result = groupService.joinGroup(1, "hong1234");
		System.out.println("result: " + result);
	}
	
	
}
