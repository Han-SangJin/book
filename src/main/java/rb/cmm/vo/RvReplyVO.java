package rb.cmm.vo;

public class RvReplyVO {

	private int rvReNo;			// 서평 댓글번호
	private int rvNo;			// 서평 글 번호
	private String memId;		// 회원 아이디
	private String rvReCont;	// 서평 댓글
	private String rvReDt;		// 서평 댓글 작성 날짜
	
	public int getRvReNo() {
		return rvReNo;
	}
	public void setRvReNo(int rvReNo) {
		this.rvReNo = rvReNo;
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
	public String getRvReCont() {
		return rvReCont;
	}
	public void setRvReCont(String rvReCont) {
		this.rvReCont = rvReCont;
	}
	public String getRvReDt() {
		return rvReDt;
	}
	public void setRvReDt(String rvReDt) {
		this.rvReDt = rvReDt;
	}
	
	
	
}
