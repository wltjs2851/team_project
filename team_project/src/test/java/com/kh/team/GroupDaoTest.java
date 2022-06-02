package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.GroupDao;
import com.kh.team.vo.GroupVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class GroupDaoTest {
	
	@Autowired
	private GroupDao groupDao;
	
	@Test
	public void testGroupInsert() {
		GroupVo groupVo = new GroupVo("족구모임", "수영", 7, "족구하는 모임입니다~", "울산", null, "user08");
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
		GroupVo groupVo = new GroupVo(1, "축구모임", "축구", 13, "축구하는 모임입니다~", "부산", null, "user01, user02");
		boolean result = groupDao.updateGroup(groupVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testGroupDelete() {
		boolean result = groupDao.deleteGroup(1);
		System.out.println("result: " + result);
	}
}
