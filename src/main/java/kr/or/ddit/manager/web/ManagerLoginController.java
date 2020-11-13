package kr.or.ddit.manager.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.manager.service.ManagerLoginServiceI;
import rb.cmm.vo.ManagerVO;

@Controller
public class ManagerLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerLoginController.class);
	
	@Autowired	// ioc.xml내용 자동으로 불러옴
	
	@Resource(name="managerloginService")
	ManagerLoginServiceI managerloginservice;
	
	
	// 파라미터 이름과 동일한 이름의 메소드 인자를 선언하면 스프링 프레임워크가 자동으로 바인딩 해준다.
	// 값을 담을 수 있는 객체를 메소드 인자로 선언한 경우에도 필드명과 파라미터 명이 동일하면 자동으로 바인딩 처리를 해준다
	// 이때 값을 담는 객체를 스프링 프레임워크에서는 command 객체라고 명명한다.
	// form 으로 전송한 데이터를 받는 객체 = command 객체
	
	//private String mngId;		// 관리자 아이디
	//private String mngPass;	// 관리자 비밀번호
	//		jsp/servlet 기반의 request 역할을 담당
	@RequestMapping(name="/mngLogin", params= {"mngId", "mngPass"} , method = RequestMethod.POST)
	public String mngLogin(String mngId, String mngPass, ManagerVO managerVo , HttpSession session, Model model) {	
		
		
		//logger로 id, pass 값 띄워줌
		logger.debug("ManagerLoginController.mngLogin() {} / {} / {}", mngId, mngPass, managerVo);	
		
		// bean Dao에서 멤버 조회
		ManagerVO dbmanagerVo = managerloginservice.getManager(mngId);
		logger.debug("dbmanagerVo : {}", dbmanagerVo);
		
		 
		// db에서 조회한 사용자 정보가 존재하면 ==> main.jsp 로 이동
		// db에서 조회한 사용자 정보가 존쟂하지 않으면 ==> login.jsp 로 이동
		//dbMember.getPass().equals(pass)
			
		if(dbmanagerVo != (null) && managerVo.getMngPass().equals(dbmanagerVo.getMngPass()) ) {
			// prefix : /WEB-INF/views/
			// surfix : .jsp
			//	managerMainPage.jsp
			session.setAttribute("S_MEMBER", managerVo);
			
			return "managerMainPage.jsp";
				
		}else {
			model.addAttribute("msg","fail");
			return "redirect:mngLogin";
		}
			
	}


}
