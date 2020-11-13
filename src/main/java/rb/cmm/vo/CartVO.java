package rb.cmm.vo;

public class CartVO {

	private String cartNo; // 장바구니 번호
	private String memId;  // 아이디
	private int cartQty;   // 장바구니 수량
	private int cartPrice; // 장바구니 총가격
	private String bkIsbn; // ISBN코드
	private String ticCd;  // 자유이용권 코드
	private int ticSq;     // 자유이용권 시퀀스
	private String cartDt;	// 장바구니 등록일
	
	
	public String getCartDt() {
		return cartDt;
	}
	public void setCartDt(String cartDt) {
		this.cartDt = cartDt;
	}
	public String getCartNo() {
		return cartNo;
	}
	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	public int getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}
	public String getBkIsbn() {
		return bkIsbn;
	}
	public void setBkIsbn(String bkIsbn) {
		this.bkIsbn = bkIsbn;
	}
	public String getTicCd() {
		return ticCd;
	}
	public void setTicCd(String ticCd) {
		this.ticCd = ticCd;
	}
	public int getTicSq() {
		return ticSq;
	}
	public void setTicSq(int ticSq) {
		this.ticSq = ticSq;
	}
}
