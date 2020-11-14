package kr.or.ddit.manager.service;

import javax.annotation.Resource;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.manager.dao.ManagerDaoI;
import rb.cmm.vo.ManagerVO;

@Service("managerService")		// @service Bean 객체 선언, web에서 @Resource(name="memberService") 로 사용가능
@Transactional
public class ManagerService implements ManagerServiceI {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ManagerService.class);
	
	@Resource(name="managerDao")	// Dao 에서 @Repository로 지정한 이름
	private ManagerDaoI managerDao;
	

	public void setMemberDao(ManagerDaoI managerDao) {
		this.managerDao = managerDao;
	}
	
	
	// service 기본 생성자
	public ManagerService() {
		
	}
	
	
	@Override
	public ManagerVO getManager(String mng_id) {
		logger.debug("ManagerService - mngId : {}", mng_id);
		return managerDao.getManager(mng_id);
	}

}
