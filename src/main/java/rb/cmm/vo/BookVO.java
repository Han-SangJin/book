package rb.cmm.vo;

public class BookVO {
	

	private String bk_isbn;  // ISBN코드
	private String prod_cd;  // 상품구분코드
	private String bkgre_cd; // 도서장르코드
	private int bk_st;       // 대여이용여부
	private String bk_nm;    // 도서명
	private String bk_atr;   // 저자
	private String bk_pbl;   // 출판사
	private int bk_page;     // 페이지 수
	private String bk_arti;  // 소개글
	private int bk_grade;    // 평점
	private int bk_sel_price; // 판매가
	private int bk_fix_price; // 정가
	private int bk_sales_qty; // 판매량
	private int file_id;     // 파일ID
	private int img_id;      // 이미지ID
	private String bk_dt;	// 출판일
	
	
	
	public String getBk_isbn() {
		return bk_isbn;
	}
	public void setBk_isbn(String bk_isbn) {
		this.bk_isbn = bk_isbn;
	}
	public String getProd_cd() {
		return prod_cd;
	}
	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
	}
	public String getBkgre_cd() {
		return bkgre_cd;
	}
	public void setBkgre_cd(String bkgre_cd) {
		this.bkgre_cd = bkgre_cd;
	}
	public int getBk_st() {
		return bk_st;
	}
	public void setBk_st(int bk_st) {
		this.bk_st = bk_st;
	}
	public String getBk_nm() {
		return bk_nm;
	}
	public void setBk_nm(String bk_nm) {
		this.bk_nm = bk_nm;
	}
	public String getBk_atr() {
		return bk_atr;
	}
	public void setBk_atr(String bk_atr) {
		this.bk_atr = bk_atr;
	}
	public String getBk_pbl() {
		return bk_pbl;
	}
	public void setBk_pbl(String bk_pbl) {
		this.bk_pbl = bk_pbl;
	}
	public int getBk_page() {
		return bk_page;
	}
	public void setBk_page(int bk_page) {
		this.bk_page = bk_page;
	}
	public String getBk_arti() {
		return bk_arti;
	}
	public void setBk_arti(String bk_arti) {
		this.bk_arti = bk_arti;
	}
	public int getBk_grade() {
		return bk_grade;
	}
	public void setBk_grade(int bk_grade) {
		this.bk_grade = bk_grade;
	}
	public int getBk_sel_price() {
		return bk_sel_price;
	}
	public void setBk_sel_price(int bk_sel_price) {
		this.bk_sel_price = bk_sel_price;
	}
	public int getBk_fix_price() {
		return bk_fix_price;
	}
	public void setBk_fix_price(int bk_fix_price) {
		this.bk_fix_price = bk_fix_price;
	}
	public int getBk_sales_qty() {
		return bk_sales_qty;
	}
	public void setBk_sales_qty(int bk_sales_qty) {
		this.bk_sales_qty = bk_sales_qty;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}
	public String getBk_dt() {
		return bk_dt;
	}
	public void setBk_dt(String bk_dt) {
		this.bk_dt = bk_dt;
	}
	
	
	
	@Override
	public String toString() {
		return "BookVO [bk_isbn=" + bk_isbn + ", prod_cd=" + prod_cd + ", bkgre_cd=" + bkgre_cd + ", bk_st=" + bk_st
				+ ", bk_nm=" + bk_nm + ", bk_atr=" + bk_atr + ", bk_pbl=" + bk_pbl + ", bk_page=" + bk_page
				+ ", bk_arti=" + bk_arti + ", bk_grade=" + bk_grade + ", bk_sel_price=" + bk_sel_price
				+ ", bk_fix_price=" + bk_fix_price + ", bk_sales_qty=" + bk_sales_qty + ", file_id=" + file_id
				+ ", img_id=" + img_id + ", bk_dt=" + bk_dt + "]";
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bk_arti == null) ? 0 : bk_arti.hashCode());
		result = prime * result + ((bk_atr == null) ? 0 : bk_atr.hashCode());
		result = prime * result + ((bk_dt == null) ? 0 : bk_dt.hashCode());
		result = prime * result + bk_fix_price;
		result = prime * result + bk_grade;
		result = prime * result + ((bk_isbn == null) ? 0 : bk_isbn.hashCode());
		result = prime * result + ((bk_nm == null) ? 0 : bk_nm.hashCode());
		result = prime * result + bk_page;
		result = prime * result + ((bk_pbl == null) ? 0 : bk_pbl.hashCode());
		result = prime * result + bk_sales_qty;
		result = prime * result + bk_sel_price;
		result = prime * result + bk_st;
		result = prime * result + ((bkgre_cd == null) ? 0 : bkgre_cd.hashCode());
		result = prime * result + file_id;
		result = prime * result + img_id;
		result = prime * result + ((prod_cd == null) ? 0 : prod_cd.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookVO other = (BookVO) obj;
		if (bk_arti == null) {
			if (other.bk_arti != null)
				return false;
		} else if (!bk_arti.equals(other.bk_arti))
			return false;
		if (bk_atr == null) {
			if (other.bk_atr != null)
				return false;
		} else if (!bk_atr.equals(other.bk_atr))
			return false;
		if (bk_dt == null) {
			if (other.bk_dt != null)
				return false;
		} else if (!bk_dt.equals(other.bk_dt))
			return false;
		if (bk_fix_price != other.bk_fix_price)
			return false;
		if (bk_grade != other.bk_grade)
			return false;
		if (bk_isbn == null) {
			if (other.bk_isbn != null)
				return false;
		} else if (!bk_isbn.equals(other.bk_isbn))
			return false;
		if (bk_nm == null) {
			if (other.bk_nm != null)
				return false;
		} else if (!bk_nm.equals(other.bk_nm))
			return false;
		if (bk_page != other.bk_page)
			return false;
		if (bk_pbl == null) {
			if (other.bk_pbl != null)
				return false;
		} else if (!bk_pbl.equals(other.bk_pbl))
			return false;
		if (bk_sales_qty != other.bk_sales_qty)
			return false;
		if (bk_sel_price != other.bk_sel_price)
			return false;
		if (bk_st != other.bk_st)
			return false;
		if (bkgre_cd == null) {
			if (other.bkgre_cd != null)
				return false;
		} else if (!bkgre_cd.equals(other.bkgre_cd))
			return false;
		if (file_id != other.file_id)
			return false;
		if (img_id != other.img_id)
			return false;
		if (prod_cd == null) {
			if (other.prod_cd != null)
				return false;
		} else if (!prod_cd.equals(other.prod_cd))
			return false;
		return true;
	}
	
	

}
