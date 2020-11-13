package rb.cmm.vo;

public class BookVO {

	private String bkIsbn;  // ISBN코드
	private String prodCd;  // 상품구분코드
	private String bkGreCd; // 도서장르코드
	private int bkSt;       // 대여이용여부
	private String bkNm;    // 도서명
	private String bkAtr;   // 저자
	private String bkPbl;   // 출판사
	private int bkPage;     // 페이지 수
	private String bkArti;  // 소개글
	private int bkGrade;    // 평점
	private int bkSelPrice; // 판매가
	private int bkFixPrice; // 정가
	private int bkSalesQty; // 판매량
	private int fileId;     // 파일ID
	private int imgId;      // 이미지ID
	private String bkDt;	// 출판일
	
	public String getBkGreCd() {
		return bkGreCd;
	}
	public void setBkGreCd(String bkGreCd) {
		this.bkGreCd = bkGreCd;
	}
	public String getBkDt() {
		return bkDt;
	}
	public void setBkDt(String bkDt) {
		this.bkDt = bkDt;
	}
	public String getBkIsbn() {
		return bkIsbn;
	}
	public void setBkIsbn(String bkIsbn) {
		this.bkIsbn = bkIsbn;
	}
	public String getProdCd() {
		return prodCd;
	}
	public void setProdCd(String prodCd) {
		this.prodCd = prodCd;
	}
	public String getBkgreCd() {
		return bkGreCd;
	}
	public void setBkgreCd(String bkgreCd) {
		this.bkGreCd = bkgreCd;
	}
	public int getBkSt() {
		return bkSt;
	}
	public void setBkSt(int bkSt) {
		this.bkSt = bkSt;
	}
	public String getBkNm() {
		return bkNm;
	}
	public void setBkNm(String bkNm) {
		this.bkNm = bkNm;
	}
	public String getBkAtr() {
		return bkAtr;
	}
	public void setBkAtr(String bkAtr) {
		this.bkAtr = bkAtr;
	}
	public String getBkPbl() {
		return bkPbl;
	}
	public void setBkPbl(String bkPbl) {
		this.bkPbl = bkPbl;
	}
	public int getBkPage() {
		return bkPage;
	}
	public void setBkPage(int bkPage) {
		this.bkPage = bkPage;
	}
	public String getBkArti() {
		return bkArti;
	}
	public void setBkArti(String bkArti) {
		this.bkArti = bkArti;
	}
	public int getBkGrade() {
		return bkGrade;
	}
	public void setBkGrade(int bkGrade) {
		this.bkGrade = bkGrade;
	}
	public int getBkSelPrice() {
		return bkSelPrice;
	}
	public void setBkSelPrice(int bkSelPrice) {
		this.bkSelPrice = bkSelPrice;
	}
	public int getBkFixPrice() {
		return bkFixPrice;
	}
	public void setBkFixPrice(int bkFixPrice) {
		this.bkFixPrice = bkFixPrice;
	}
	public int getBkSalesQty() {
		return bkSalesQty;
	}
	public void setBkSalesQty(int bkSalesQty) {
		this.bkSalesQty = bkSalesQty;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public int getImgId() {
		return imgId;
	}
	public void setImgId(int imgId) {
		this.imgId = imgId;
	}
}
