package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.GroupBoardDao;
import com.kh.team.vo.GroupBoardVo;
import com.kh.team.vo.SearchDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class GroupBoardDaoTest {
	
	@Autowired
	private GroupBoardDao groupBoardDao;
	
	@Test
	public void testCreate() { // 지금 당장은 아이디 널 값 가능하도록
		GroupBoardVo groupBoardVo = new GroupBoardVo("b", "c", null, null, null);
		boolean result = groupBoardDao.create(groupBoardVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testDelete() {
		boolean result = groupBoardDao.delete(3);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testUpdate() {
		GroupBoardVo groupBoardVo = new GroupBoardVo("abc", "def", null, null, null);
		groupBoardVo.setGbno(4);
		boolean result = groupBoardDao.update(groupBoardVo);
		System.out.println("result: " + result);
	}
	
//	@Test
//	public void testUpdateComment() { // 왜 false가 나온는 것인지???
////		boolean result = groupBoardDao.updateComment(1);
////		System.out.println("result: " + result);
//		groupBoardDao.updateComment(1);
//	}

	@Test
	public void testCountComment() {
		int count = groupBoardDao.countComment(1);
		System.out.println("count: " + count);
	}
	
	@Test
	public void testList() {
		SearchDto searchDto = new SearchDto("t", "1");
		List<GroupBoardVo> list = groupBoardDao.list(11, searchDto);
		System.out.println("list: " + list);
	}
}
