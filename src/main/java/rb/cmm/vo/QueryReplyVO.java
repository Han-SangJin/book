package rb.cmm.vo;

public class QueryReplyVO {
	
	private int qryReNo;		// 문의 답글 번호
	private int qryNo;			// 문의 글 번호
	private String mngId;		// 관리자 아이디
	private String qryReTitle;	// 문의 답글 제목
	private String qryReCont;	// 문의 답글 내용
	private String qryReDt;		// 문의 답글 날짜
	
	public int getQryReNo() {
		return qryReNo;
	}
	public void setQryReNo(int qryReNo) {
		this.qryReNo = qryReNo;
	}
	public int getQryNo() {
		return qryNo;
	}
	public void setQryNo(int qryNo) {
		this.qryNo = qryNo;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getQryReTitle() {
		return qryReTitle;
	}
	public void setQryReTitle(String qryReTitle) {
		this.qryReTitle = qryReTitle;
	}
	public String getQryReCont() {
		return qryReCont;
	}
	public void setQryReCont(String qryReCont) {
		this.qryReCont = qryReCont;
	}
	public String getQryReDt() {
		return qryReDt;
	}
	public void setQryReDt(String qryReDt) {
		this.qryReDt = qryReDt;
	}
	
	
	

}
