package com.kh.team;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.GroupBoardDao;
import com.kh.team.vo.GroupBoardVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class GroupBoardDaoTest {
	
	@Autowired
	private GroupBoardDao groupBoardDao;
	
	@Test
	public void testCreate() { // 지금 당장은 아이디 널 값 가능하도록
		GroupBoardVo groupBoardVo = new GroupBoardVo("a", "b", null, null, null);
		boolean result = groupBoardDao.create(groupBoardVo);
		System.out.println("result: " + result);
	}

}
