package kr.or.ddit.main.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.manager.web.ManagerController;

@RequestMapping("/main")
@Controller
public class MainPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired	// ioc.xml내용 자동으로 불러옴
	
	
	
	// localhost/login/view 요청시 처리되는 메소드
	// 요청 메소드가 GET 일때만 처리  method= RequestMethod.GET
	// 요청 메소드 복수개 설정  {RequestMethod.GET, RequestMethod.POST}
	
	@RequestMapping(path = "/view", method = RequestMethod.GET)	
	public String getView() {
		logger.debug("LoginController.getView()");
		return "mainPage";	// 이동할 url 리턴 
	}
}
