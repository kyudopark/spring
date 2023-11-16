package kr.co.ezen.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.ezen.entity.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTest {

	@Autowired
	BoardService boardService;
	
	@Test
	public void testgetList() {
		Criteria cri=new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		boardService.getList(cri).forEach(b->log.info(b));
	}
	
	
}
