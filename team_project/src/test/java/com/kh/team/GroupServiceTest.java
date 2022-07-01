package com.kh.team;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.service.GroupService;
import com.kh.team.vo.GroupVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class GroupServiceTest {
	@Autowired
	GroupService groupService;
	
//	@Test
//	public void testInsertGroupJoin() {
//		String[] users = {"gogo11",
//				"user01",
//				"tuna11",
//				"jm1004",
//				"domidgirl33"};
//		for (String user : users) {
//			groupService.joinGroup(11, user);
//		}
//		
//	}
	
	@Test
	public void testJoinGroup() {
		
	}
}
