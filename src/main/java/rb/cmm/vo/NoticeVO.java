package rb.cmm.vo;

public class NoticeVO {

	private int ntNo;		// 공지 번호
	private String mngId;	// 관리자 아이디
	private String ntTitle;	// 공지 제목
	private String ntCont;	// 공지 내용
	private String ntDt;	// 공지 작성일
	
	public int getNtNo() {
		return ntNo;
	}
	public void setNtNo(int ntNo) {
		this.ntNo = ntNo;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtCont() {
		return ntCont;
	}
	public void setNtCont(String ntCont) {
		this.ntCont = ntCont;
	}
	public String getNtDt() {
		return ntDt;
	}
	public void setNtDt(String ntDt) {
		this.ntDt = ntDt;
	}
	
	
}
