package rb.cmm.vo;

public class QueryVO {
	
	private int qryNo;			// 문의 분류번호
	private String qCatgCd;		// 카테고리 분류 코드
	private String memId;		// 회원 아이디
	private String qryTitle;	// 문의 제목
	private String qryCont;		// 문의 내용
	private String qryDt;		// 문의 작성 날짜
	
	
	public int getQryNo() {
		return qryNo;
	}
	public void setQryNo(int qryNo) {
		this.qryNo = qryNo;
	}
	public String getqCatgCd() {
		return qCatgCd;
	}
	public void setqCatgCd(String qCatgCd) {
		this.qCatgCd = qCatgCd;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getQryTitle() {
		return qryTitle;
	}
	public void setQryTitle(String qryTitle) {
		this.qryTitle = qryTitle;
	}
	public String getQryCont() {
		return qryCont;
	}
	public void setQryCont(String qryCont) {
		this.qryCont = qryCont;
	}
	public String getQryDt() {
		return qryDt;
	}
	public void setQryDt(String qryDt) {
		this.qryDt = qryDt;
	}
	
	
	
	

}
