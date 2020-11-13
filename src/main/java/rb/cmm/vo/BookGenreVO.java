package rb.cmm.vo;

public class BookGenreVO {

	private String bkGreCd;  // 구분 코드
	private int bkGreNo;     // 구분 번호
	private String bkGreNm;  // 구분 이름
	
	public String getBkGreCd() {
		return bkGreCd;
	}
	public void setBkGreCd(String bkGreCd) {
		this.bkGreCd = bkGreCd;
	}
	public int getBkGreNo() {
		return bkGreNo;
	}
	public void setBkGreNo(int bkGreNo) {
		this.bkGreNo = bkGreNo;
	}
	public String getBkGreNm() {
		return bkGreNm;
	}
	public void setBkGreNm(String bkGreNm) {
		this.bkGreNm = bkGreNm;
	}
}
