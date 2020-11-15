package kr.or.ddit.book.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.book.dao.BookDaoI;
import rb.cmm.vo.BookVO;

@Service("bookService")
public class BookService implements BookServiceI{
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(BookService.class);
	
	@Resource(name="bookDao")	// Dao 에서 @Repository로 지정한 이름
	private BookDaoI BookDao;
	

	public void setMemberDao(BookDaoI BookDao) {
		this.BookDao = BookDao;
	}
	
	
	// service 기본 생성자
	public BookService() {
		
	}
	
	
	@Override
	public int BookInsert(BookVO vo) {
		logger.debug("BookService - BookInsert : " ,vo);
		return BookDao.BookInsert(vo);
	}


	@Override
	public List<BookVO> BookList() {
		return BookDao.BookList();
	}


	@Override
	public int BookUpdate(BookVO vo) {
		logger.debug("BookService - BookUpdate : " ,vo);
		return BookDao.BookUpdate(vo);
	}

	
	@Override
	public BookVO BookSelect(String rvNo) {
		logger.debug("BookService - BookSelect : " ,rvNo);
		return BookDao.BookSelect(rvNo);
	}
	
	
	@Override
	public int BookDelete(int renum) {
		logger.debug("BookService - BookSelect : " ,renum);
		return BookDao.BookDelete(renum);
	}
	
	
	
	@Override
	public List<BookVO> selectPage(Map<String, Integer> map) {
		return BookDao.selectPage(map);
	}
	
 
	@Override
	public int getTotalCount(){
		return BookDao.getTotalCount();
	}
}
