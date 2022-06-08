package com.kh.team;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.team.dao.RecipeCommentDao;
import com.kh.team.dao.RecipeDao;
import com.kh.team.dao.RecommendLikeDao;
import com.kh.team.vo.RecipeCommentVo;
import com.kh.team.vo.RecipeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class RecommendLikeDaoTest {
	
	@Autowired
	private RecommendLikeDao reLikeDao;
	
}
