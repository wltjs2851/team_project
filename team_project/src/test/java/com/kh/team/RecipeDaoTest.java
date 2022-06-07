package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.RecipeDao;
import com.kh.team.vo.RecipeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class RecipeDaoTest {
	
	@Autowired
	RecipeDao recipeDao;
	
	@Test
	public void testRecipeInsert() {
		RecipeVo recipeVo = new RecipeVo("레시피2", "내용2", "hong2", null);
		boolean result = recipeDao.insertRecipe(recipeVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testRecipeList() {
		List<RecipeVo> list = recipeDao.selectRecipe();
		System.out.println("result: " + list);
	}
	
	@Test
	public void testRecipeUpdate() {
		RecipeVo recipeVo = new RecipeVo(1, "레시피1", "단백질", "user01", null);
		boolean result = recipeDao.updateRecipe(recipeVo);
		System.out.println("result: " + result);
	}
	
	@Test
	public void testRecipeDelete() {
		boolean result = recipeDao.deleteRecipe(1);
		System.out.println("result: " + result);
	}

}
