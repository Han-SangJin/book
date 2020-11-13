package kr.or.ddit.manager.service;

import javax.annotation.Resource;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.manager.dao.ManagerLoginDaoI;
import rb.cmm.vo.ManagerVO;

@Service("managerloginService")		// @service Bean 객체 선언, web에서 @Resource(name="memberService") 로 사용가능
public class ManagerLoginService implements ManagerLoginServiceI {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ManagerLoginService.class);
	
	@Resource(name="managerloginDao")	// Dao 에서 @Repository로 지정한 이름
	private ManagerLoginDaoI managerloginDao;
	

	public void setMemberDao(ManagerLoginDaoI managerloginDao) {
		this.managerloginDao = managerloginDao;
	}
	
	
	// service 기본 생성자
	public ManagerLoginService() {
		
	}
	
	
	@Override
	public ManagerVO getManager(String mngId) {
		logger.debug("ManagerLoginService - mngId : {}", mngId);
		return managerloginDao.getManager(mngId);
	}

}
