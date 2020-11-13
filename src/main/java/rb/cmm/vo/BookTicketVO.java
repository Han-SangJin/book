package rb.cmm.vo;

public class BookTicketVO {

	private String ticCd;     // 코드
	private int ticSq;        // 시퀀스
	private String ticNm;     // 이름
	private int ticPrice;     // 가격
	private String startDate; // 이용 시작날짜
	private String endDate;   // 이용 종료날짜
	
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
	public String getTicNm() {
		return ticNm;
	}
	public void setTicNm(String ticNm) {
		this.ticNm = ticNm;
	}
	public int getTicPrice() {
		return ticPrice;
	}
	public void setTicPrice(int ticPrice) {
		this.ticPrice = ticPrice;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
