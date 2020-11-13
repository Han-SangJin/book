package rb.cmm.vo;

public class OrderVO {
	
	private String ordNo;			// 주문번호
	private String memId;			// 회원 아이디
	private String cartNo;			// 장바구니 번호
	private String ordRecv;			// 수취인
	private int ordAddrSq;			// 수취인 시퀀스번호(기본주소)
	private String ordAddrDetail;	// 수취인 시퀀스번호(상세주소)
	private String ordHp;			// 수취인 핸드폰번호
	private int ordSt;				// 현재 배송상태
	private String ordDt;			// 주문일
	private int ordPrice;			// 결제금액(판매가 총액 - 마일리지 사용액)
	
	
	
	
	public int getOrdPrice() {
		return ordPrice;
	}
	public void setOrdPrice(int ordPrice) {
		this.ordPrice = ordPrice;
	}
	public String getOrdDt() {
		return ordDt;
	}
	public void setOrdDt(String ordDt) {
		this.ordDt = ordDt;
	}
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getCartNo() {
		return cartNo;
	}
	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}
	public String getOrdRecv() {
		return ordRecv;
	}
	public void setOrdRecv(String ordRecv) {
		this.ordRecv = ordRecv;
	}
	public int getOrdAddrSq() {
		return ordAddrSq;
	}
	public void setOrdAddrSq(int ordAddrSq) {
		this.ordAddrSq = ordAddrSq;
	}
	public String getOrdAddrDetail() {
		return ordAddrDetail;
	}
	public void setOrdAddrDetail(String ordAddrDetail) {
		this.ordAddrDetail = ordAddrDetail;
	}
	public String getOrdHp() {
		return ordHp;
	}
	public void setOrdHp(String ordHp) {
		this.ordHp = ordHp;
	}
	public int getOrdSt() {
		return ordSt;
	}
	public void setOrdSt(int ordSt) {
		this.ordSt = ordSt;
	}
	

}
