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
import org.springframework.web.bind.annotation.RequestParam;

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

	
	
	
	
	// RequestParam 으로 변수 명이 다를때 파라미터를 특정 변수에 할당 할 수 있다
	@RequestMapping(path = "/BookSave", method = RequestMethod.POST)	
	public String BookSave(Model model, @RequestParam(name="bkIsbn") String bk_isbn
									  , @RequestParam(name="prodCd") String prod_cd
									  , @RequestParam(name="bkGreCd") String bkgre_cd
									  , @RequestParam(name="bkSt") String bk_st
									  , @RequestParam(name="bkNm") String bk_nm
									  , @RequestParam(name="bkAtr") String bk_atr
									  , @RequestParam(name="bkPbl") String bk_pbl
									  , @RequestParam(name="bkPage") String bk_page
									  , @RequestParam(name="bkArti") String bk_arti
									  , @RequestParam(name="bkGrade") String bk_grade
									  , @RequestParam(name="bkSelPrice") String bk_sel_price
									  , @RequestParam(name="bkFixPrice") String bk_fix_price
									  , @RequestParam(name="bkSalesQty") String bk_sales_qty
									  , @RequestParam(name="fileId") String file_id
									  , @RequestParam(name="imgId") String img_id) {
		
		
		//0. 클라이언트 전송시
		BookVO bo = new BookVO();
		
		bo.setBk_isbn(bk_isbn);
		bo.setProd_cd(prod_cd);
		bo.setBkgre_cd(bkgre_cd);
		bo.setBk_st(Integer.parseInt(bk_st));
		bo.setBk_nm(bk_nm);
		bo.setBk_atr(bk_atr); 
		bo.setBk_pbl(bk_pbl);
		bo.setBk_page(Integer.parseInt(bk_page));
		bo.setBk_arti(bk_arti);
		bo.setBk_grade(Integer.parseInt(bk_grade));
		bo.setBk_sel_price(Integer.parseInt(bk_sel_price));
		bo.setBk_fix_price(Integer.parseInt(bk_fix_price));
		bo.setBk_sales_qty(Integer.parseInt(bk_sales_qty));
		bo.setFile_id(Integer.parseInt(file_id));
		bo.setImg_id(1);
			
		 
		//2. service 메소드 호출
		int cnt =  bookservice.BookInsert(bo);
		logger.debug("BookController - BookSave : {}", cnt);
		
		//3. request에 저장
		model.addAttribute("bkIsbn", cnt);
		 
		//4. jsp로 forward
		return "/Pages/book";	
	}
	
	
	
	
	
	
	@RequestMapping(path = "/BookSelect", method = RequestMethod.GET)	
	public String BookUpdate(Model model, @RequestParam(name="bkIsbn") String bk_isbn) {
		
		BookVO rv = bookservice.BookSelect(bk_isbn);
		
		model.addAttribute("bookvo", rv);
		
		return "/Pages/book_view";
		
	}  
	
	
	
	
	
	
	
	// RequestParam 으로 변수 명이 다를때 파라미터를 특정 변수에 할당 할 수 있다
	@RequestMapping(path = "/BookUpdate", method = RequestMethod.POST)	
	public String BookUpdate(Model model, @RequestParam(name="bkIsbn") String bk_isbn
									  , @RequestParam(name="prodCd") String prod_cd
									  , @RequestParam(name="bkGreCd") String bkgre_cd
									  , @RequestParam(name="bkSt") String bk_st
									  , @RequestParam(name="bkNm") String bk_nm
									  , @RequestParam(name="bkAtr") String bk_atr
									  , @RequestParam(name="bkPbl") String bk_pbl
									  , @RequestParam(name="bkPage") String bk_page
									  , @RequestParam(name="bkArti") String bk_arti
									  , @RequestParam(name="bkGrade") String bk_grade
									  , @RequestParam(name="bkSelPrice") String bk_sel_price
									  , @RequestParam(name="bkFixPrice") String bk_fix_price
									  , @RequestParam(name="bkSalesQty") String bk_sales_qty
									  , @RequestParam(name="fileId") String file_id
									  , @RequestParam(name="imgId") String img_id) {
	
		
		// 클라이언트에서 전송하는 데이터
		BookVO bo = new BookVO();
		
		bo.setBk_isbn(bk_isbn);
		bo.setProd_cd(prod_cd);
		bo.setBkgre_cd(bkgre_cd);
		bo.setBk_st(Integer.parseInt(bk_st));
		bo.setBk_nm(bk_nm);
		bo.setBk_atr(bk_atr); 
		bo.setBk_pbl(bk_pbl);
		bo.setBk_page(Integer.parseInt(bk_page));
		bo.setBk_arti(bk_arti);
		bo.setBk_grade(Integer.parseInt(bk_grade));
		bo.setBk_sel_price(Integer.parseInt(bk_sel_price));
		bo.setBk_fix_price(Integer.parseInt(bk_fix_price));
		bo.setBk_sales_qty(Integer.parseInt(bk_sales_qty));
		bo.setFile_id(Integer.parseInt(file_id));
		bo.setImg_id(Integer.parseInt(img_id));
		
		
		//2.메소드 호출 
		int cnt = bookservice.BookUpdate(bo);
		
		//3.request 저장
		model.addAttribute("bkIsbn", cnt);
		
		//4. jsp로
		return "/Pages/book_update";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping(path = "/BookDelete", method = RequestMethod.POST)	
	public String BookDelete(Model model, @RequestParam(name="bkIsbn") String bk_isbn) {
		
		int isbn = Integer.parseInt(bk_isbn);
		
		//2. service 메소드 호출
		int count =  bookservice.BookDelete(isbn);
		
		//3. request에 저장
		model.addAttribute("bkIsbn", count);
		 
		return "/Pages/book_save";
	}
}	
