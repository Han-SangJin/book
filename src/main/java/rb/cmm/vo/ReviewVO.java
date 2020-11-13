package rb.cmm.vo;

public class ReviewVO {
	        

	private int rvNo;		// 글 번호 
	private String memId;	// 회원 아이디
	private String ordNo;	// 주문번호       
	private String cartNo;	// 상품을 장바구니에 넣으면 상품당 생기는번호  
	private String rvTitle;	// 서평 제목    
	private String rvCont;	// 서평 내용 
	private String rvDt;	// 날짜  
	private int rvGr;		// 평점
	
	
	
	public int getRvGr() {
		return rvGr;
	}
	public void setRvGr(int rvGr) {
		this.rvGr = rvGr;
	}
	public int getRvNo() {
		return rvNo;
	}
	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public String getCartNo() {
		return cartNo;
	}
	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}
	public String getRvTitle() {
		return rvTitle;
	}
	public void setRvTitle(String rvTitle) {
		this.rvTitle = rvTitle;
	}
	public String getRvCont() {
		return rvCont;
	}
	public void setRvCont(String rvCont) {
		this.rvCont = rvCont;
	}
	public String getRvDt() {
		return rvDt;
	}
	public void setRvDt(String rvDt) {
		this.rvDt = rvDt;
	}
	
	

}
