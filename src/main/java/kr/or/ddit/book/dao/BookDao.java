package kr.or.ddit.book.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import rb.cmm.vo.BookVO;

@Repository("bookDao") 
public class BookDao implements BookDaoI {
	

	private static final Logger logger = LoggerFactory.getLogger(BookDao.class);
	
											// mybatis 로 바로 호출하는 역할 data source 에 선언되어 있음 
	@Resource(name="sqlSessionTemplate")	//==  SqlSession sqlSession = MybatisUtil.getSession();
	private SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public int BookInsert(BookVO vo) {
		return (Integer) sqlSession.selectOne("book.bookInsert", vo);
	}
	

	@Override
	public List<BookVO> BookList() {
		return sqlSession.selectList("book.bookList");
	}
	
	 
	@Override
	public String BookUpdate(BookVO vo) {
		return Integer.toString(sqlSession.selectOne("book.bookUpdate", vo));
	}
	
	
	@Override
	public BookVO BookSelect(String rvNo) {
		return (BookVO) sqlSession.selectOne("book.bookSelect", rvNo);
	} 
	
	
	@Override
	public int BookDelete(int rvReNo) {
		return sqlSession.selectOne("book.bookDelete", rvReNo);
	}
	
	
	@Override
	public List<BookVO> selectPage(Map<String, Integer> map) {
		List<BookVO> selectPage = sqlSession.selectList("book.selectPage", map);
		logger.debug("start : {} end : {}", map.get("start"), map.get("end"));
		logger.debug("BookDao - selectPage : {}", selectPage);
		return selectPage;
	}
	
	
	@Override
	public int getTotalCount() {
		int getTotalCount = (Integer) sqlSession.selectOne("book.getTotalCount");
		logger.debug("BookDao - getTotalCount : {}", getTotalCount);
		return getTotalCount;
	}


	
}
