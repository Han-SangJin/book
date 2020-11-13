package rb.cmm.vo;

public class AddrVO {

	private String addrZip;    // 우편번호
	private String addrSido;   // 주소상의 시와 도 구분
	private String addrGugun;  // 구와 군 구분
	private String addrDong;   // 동 구분
	private String addrBunji;  // 번지수 구분
	private String addrRi;     // 리 구분
	private String addrBldg;   // 빌딩단위 구분
	private int addrSq;        // 시퀀스
	
	public String getAddrZip() {
		return addrZip;
	}
	public void setAddrZip(String addrZip) {
		this.addrZip = addrZip;
	}
	public String getAddrSido() {
		return addrSido;
	}
	public void setAddrSido(String addrSido) {
		this.addrSido = addrSido;
	}
	public String getAddrGugun() {
		return addrGugun;
	}
	public void setAddrGugun(String addrGugun) {
		this.addrGugun = addrGugun;
	}
	public String getAddrDong() {
		return addrDong;
	}
	public void setAddrDong(String addrDong) {
		this.addrDong = addrDong;
	}
	public String getAddrBunji() {
		return addrBunji;
	}
	public void setAddrBunji(String addrBunji) {
		this.addrBunji = addrBunji;
	}
	public String getAddrRi() {
		return addrRi;
	}
	public void setAddrRi(String addrRi) {
		this.addrRi = addrRi;
	}
	public String getAddrBldg() {
		return addrBldg;
	}
	public void setAddrBldg(String addrBldg) {
		this.addrBldg = addrBldg;
	}
	public int getAddrSq() {
		return addrSq;
	}
	public void setAddrSq(int addrSq) {
		this.addrSq = addrSq;
	}
}
