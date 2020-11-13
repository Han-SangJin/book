package kr.or.ddit.manager.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import rb.cmm.vo.ManagerVO;

@Repository("managerloginDao") //설정한 이름을 service 에서 호출가능, @repository를 스캔해서 root context 에서 빈객체로 지정
public class ManagerLoginDao implements ManagerLoginDaoI {

	private static final Logger logger = LoggerFactory.getLogger(ManagerLoginDao.class);
	
											// mybatis 로 바로 호출하는 역할 data source 에 선언되어 있음 
	@Resource(name="sqlSessionTemplate")	//==  SqlSession sqlSession = MybatisUtil.getSession();
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ManagerVO getManager(String mngId) {
		ManagerVO managerVo = sqlSession.selectOne("manager.getManager", mngId);
		logger.debug("ManagerLoginDao - managerVo : {}", managerVo);
		
		// sqlSession.close();
		return managerVo;
	}

}
