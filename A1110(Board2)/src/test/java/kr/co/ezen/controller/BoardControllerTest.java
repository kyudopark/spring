package kr.co.ezen.controller;


import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class BoardControllerTest {

	@Autowired
	private WebApplicationContext ctx;	//스프링 컨테이너
	
	private MockMvc mockMvc;	//가상의 mvc환경을 만든다(서버를 구동하지 않고 
	//(jsp만들고 톰캣구동하고 테스트 하기 불편 -> 가상mvc환경 만든다
	//-> 톰캣 구동하지 않고도 controller테스트 가능(가상으로 서버 만들어서)
	
	@Before
	public void setup() {
		this.mockMvc=MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
}
