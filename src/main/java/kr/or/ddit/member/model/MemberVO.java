

package kr.or.ddit.member.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name= "memberVo")
public class MemberVO {
	private String memId;		// 회원아이디
	private int memCd;			// 회원상태코드 0:휴면 1:정상
	private String memPass;		// 회원 비밀번호
	private String memNm;		// 회원이름
	private int memGender;		// 회원성별 1:남자 2:여자
	private String memBir;		// 회원 생년월일
	private int addrSq;			// 주소시퀀스번호 : 기본주소
	private String addrDetail;	// 상세주소
	private String memHp;		// 회원 휴대폰번호
	private String memMail;		// 회원 메일주소
	private int eMoney;			// 회원 eMoney
	private int memMile;		// 회원마일리지
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getMemCd() {
		return memCd;
	}
	public void setMemCd(int memCd) {
		this.memCd = memCd;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public int getMemGender() {
		return memGender;
	}
	public void setMemGender(int memGender) {
		this.memGender = memGender;
	}
	public String getMemBir() {
		return memBir;
	}
	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}
	public int getAddrSq() {
		return addrSq;
	}
	public void setAddrSq(int addrSq) {
		this.addrSq = addrSq;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getMemHp() {
		return memHp;
	}
	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public int geteMoney() {
		return eMoney;
	}
	public void seteMoney(int eMoney) {
		this.eMoney = eMoney;
	}
	public int getMemMile() {
		return memMile;
	}
	public void setMemMile(int memMile) {
		this.memMile = memMile;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((addrDetail == null) ? 0 : addrDetail.hashCode());
		result = prime * result + addrSq;
		result = prime * result + eMoney;
		result = prime * result + ((memBir == null) ? 0 : memBir.hashCode());
		result = prime * result + memCd;
		result = prime * result + memGender;
		result = prime * result + ((memHp == null) ? 0 : memHp.hashCode());
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
		result = prime * result + ((memMail == null) ? 0 : memMail.hashCode());
		result = prime * result + memMile;
		result = prime * result + ((memNm == null) ? 0 : memNm.hashCode());
		result = prime * result + ((memPass == null) ? 0 : memPass.hashCode());
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
		MemberVO other = (MemberVO) obj;
		if (addrDetail == null) {
			if (other.addrDetail != null)
				return false;
		} else if (!addrDetail.equals(other.addrDetail))
			return false;
		if (addrSq != other.addrSq)
			return false;
		if (eMoney != other.eMoney)
			return false;
		if (memBir == null) {
			if (other.memBir != null)
				return false;
		} else if (!memBir.equals(other.memBir))
			return false;
		if (memCd != other.memCd)
			return false;
		if (memGender != other.memGender)
			return false;
		if (memHp == null) {
			if (other.memHp != null)
				return false;
		} else if (!memHp.equals(other.memHp))
			return false;
		if (memId == null) {
			if (other.memId != null)
				return false;
		} else if (!memId.equals(other.memId))
			return false;
		if (memMail == null) {
			if (other.memMail != null)
				return false;
		} else if (!memMail.equals(other.memMail))
			return false;
		if (memMile != other.memMile)
			return false;
		if (memNm == null) {
			if (other.memNm != null)
				return false;
		} else if (!memNm.equals(other.memNm))
			return false;
		if (memPass == null) {
			if (other.memPass != null)
				return false;
		} else if (!memPass.equals(other.memPass))
			return false;
		return true;
	}
	
	
	
}
