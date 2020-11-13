package rb.cmm.vo;

public class ProdVO {
	
	private String prod_cd;		// 상품 코드
	private int prod_no;		// 상품 번호
	private String prod_nm;		// 상품 이름
	
	public String getProd_cd() {
		return prod_cd;
	}
	public void setProd_cd(String prod_cd) {
		this.prod_cd = prod_cd;
	}
	public int getProd_no() {
		return prod_no;
	}
	public void setProd_no(int prod_no) {
		this.prod_no = prod_no;
	}
	public String getProd_nm() {
		return prod_nm;
	}
	public void setProd_nm(String prod_nm) {
		this.prod_nm = prod_nm;
	}
	
	
}
