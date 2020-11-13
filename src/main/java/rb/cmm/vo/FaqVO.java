package rb.cmm.vo;

public class FaqVO {

	private int faqNo;    	 // FAQ글번호
	private String fCatgCd;  // FAQ 분류코드명
	private String mngId;    // 관리자ID
	private String faqTitle; // FAQ제목
	private String faqCont;  // FAQ내용
	private String faqDt;    // FAQ날짜
	
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getfCatgCd() {
		return fCatgCd;
	}
	public void setfCatgCd(String fCatgCd) {
		this.fCatgCd = fCatgCd;
	}
	public String getMngId() {
		return mngId;
	}
	public void setMngId(String mngId) {
		this.mngId = mngId;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqCont() {
		return faqCont;
	}
	public void setFaqCont(String faqCont) {
		this.faqCont = faqCont;
	}
	public String getFaqDt() {
		return faqDt;
	}
	public void setFaqDt(String faqDt) {
		this.faqDt = faqDt;
	}
}
