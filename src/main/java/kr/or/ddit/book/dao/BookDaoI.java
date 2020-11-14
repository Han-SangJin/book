package kr.or.ddit.book.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import rb.cmm.vo.BookVO;

public interface BookDaoI {

	// 새책 저장
	public int BookInsert(BookVO vo);

	// 책 리스트
	public List<BookVO> BookList();

	// 책정보 수정
	public String BookUpdate(BookVO vo);

	// 수정할 책 불러오기
	public BookVO BookSelect(String bkIsbn);

	// 책 삭제
	public int BookDelete(int bkIsbn);

	// 페이지별 리스트 가져오기
	public List<BookVO> selectPage(Map<String, Integer> map);

	// 전체 글갯수 가져오기
	public int getTotalCount();

}
