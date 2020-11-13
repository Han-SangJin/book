package kr.or.ddit.mvc.view;

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.view.AbstractView;


public class DownloadView extends AbstractView {
	
	private static final Logger logger = LoggerFactory.getLogger(DownloadView.class);

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	/*
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			
		MemberVO memberVo = (MemberVO) model.get("memberVo");

		logger.debug("profileImgDownload-view : " + memberVo.get);
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + memberVo.getRealFilename() + "\"");
		response.setContentType("application/octet-stream");	

		FileInputStream fis = new FileInputStream((String) memberVo.getFilename());
		ServletOutputStream sos = response.getOutputStream();
		
		byte[] buffer = new byte[512];
		
		while(fis.read(buffer) != -1) {
			sos.write(buffer);
		}
		
		fis.close();
		sos.flush();
		sos.close();
	}
	*/
}
