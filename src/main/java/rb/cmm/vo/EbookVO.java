package rb.cmm.vo;

public class EbookVO {

	private int fileId;       // 파일ID
	private String filePath;  // 파일 저장 경로
	private String fileNm;    // 저장된 파일명
	private int fileSize;     // 저장된 파일크기
	private String fileExtsn; // 저장된 파일확장자
	
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileExtsn() {
		return fileExtsn;
	}
	public void setFileExtsn(String fileExtsn) {
		this.fileExtsn = fileExtsn;
	}
}
