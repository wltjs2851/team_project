package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.RecipeCommentDao;
import com.kh.team.dao.RecipeDao;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class RecipeCommentTest {
	
	@Autowired
	RecipeCommentDao recipeCommentDao;
	
	@Test
	public void testRecipeInsert() {
		RecipeCommentVo reCommentVo = new RecipeCommentVo(8, "????4", "hong2", null);
		boolean result = recipeCommentDao.insertRecipeComment(reCommentVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testRecipeList() {
		List<RecipeCommentVo> list = recipeCommentDao.commentRecipeList(8);
		System.out.println("result: " + list);
	}

}
