package rb.cmm.vo;

public class BookImgVO {

	private int imgId;       // 이미지Id
	private String imgPath;  // 실제경로
	private String imgNm;    // 실제이름
	private int imgSize;     // 크기
	private String imgExtsn; // 이미지 확장명
	
	public int getImgId() {
		return imgId;
	}
	public void setImgId(int imgId) {
		this.imgId = imgId;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getImgNm() {
		return imgNm;
	}
	public void setImgNm(String imgNm) {
		this.imgNm = imgNm;
	}
	public int getImgSize() {
		return imgSize;
	}
	public void setImgSize(int imgSize) {
		this.imgSize = imgSize;
	}
	public String getImgExtsn() {
		return imgExtsn;
	}
	public void setImgExtsn(String imgExtsn) {
		this.imgExtsn = imgExtsn;
	}
}
