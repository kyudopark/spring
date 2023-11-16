package kr.co.ezen.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.ezen.entity.Board;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {
	
	@Autowired
	private BoardMapper boardMapper;
	
//	@Test
//	public void testgetlist() {
//		
//		List<Board> li = boardMapper.getList();
//		
//		for(Board b:li) {
//			log.info(b);
//		}
//	}
	
	@Test
	public void testinsert() {
		
		Board b = new Board();
		
		//b.setMemberID("ezen2");
		//b.setTitle("스프링2");
		b.setMemberID("ezen03");
		b.setTitle("스프링03");
		b.setContent("스프링01글");
		b.setWriter("관리자");
		
		//boardMapper.insert(b);
		boardMapper.insertSelectKey(b);
		log.info(b);
		
	}
	

}
