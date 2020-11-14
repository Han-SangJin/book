package kr.or.ddit.book.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.book.service.BookServiceI;
import rb.cmm.vo.BookVO;

@RequestMapping("/book")
@Controller
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	@Autowired	// ioc.xml내용 자동으로 불러옴
	
	@Resource(name="bookService")
	BookServiceI bookservice;
	
	
	
	// localhost/login/view 요청시 처리되는 메소드
	// 요청 메소드가 GET 일때만 처리  method= RequestMethod.GET
	// 요청 메소드 복수개 설정  {RequestMethod.GET, RequestMethod.POST}
	
	@RequestMapping(path = "/BookListPage", method = RequestMethod.GET)	
	public String BookListPage(String page, Model model) {
		logger.debug("bookController.Booklist()");
		
		//1. 클라이언트 요청시 cpage값 가져오기
		int cpage = Integer.parseInt(page);
		
		//3. 전체글갯수 구하는 메세소드 호출하기
		//한페이지당 출력 글 갯수 5개 또는 10개 
		int perlist = 10;
		int totalcount = bookservice.getTotalCount();
			  
		// 전체 페이지 수
		int totalpage = (int)(Math.ceil((double) totalcount / perlist)); // 전체글갯수 / 페이지당 글갯수  = 페이지수 
		int perblock = 2;	// 한페이지에 표현되는 페이지 수   	1-> [1][2] 2->[1][2]   3->[3][4]  4->[3][4] 			  1페이지 1~3  2페이지 4~6   3페이지 7~9
		int startpage = ((cpage-1) / perblock * perblock) + 1;
		int endpage = startpage + perblock -1;
		if(endpage > totalpage) endpage = totalpage;
		  
		// cpage값에 따라서 start와 end 값 구하기 1페이지 1~5 2페이지 6~10 3페이지 11~15
		// map에 설정하기
		int start = (cpage-1) * perlist + 1;
		int end = start + perlist -1;
		if(end > totalcount) end = totalcount;
		
		
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		//4. 페이지별 리스트 메소드 호출하기
		List<BookVO> bookList = bookservice.selectPage(map);
		
		logger.debug("start : {} end : {}", start, end);
		logger.debug("bookList : {}", bookList);
		logger.debug("spage : {} epage : {} tpage : {} cpage : {} totalcount : {}", startpage,endpage,totalpage,cpage,totalcount);
		
		//5. request에 결과 저장하기
		model.addAttribute("bookList", bookList);
		model.addAttribute("spage", startpage);
		model.addAttribute("epage", endpage);
		model.addAttribute("tpage", totalpage);
		model.addAttribute("cpage", cpage);
		
		// jsp로
		return "Pages/book_listpage";	// 이동할 url 리턴 
	}
	
}	
