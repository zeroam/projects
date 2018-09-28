package kr.co.jboard2.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;
import kr.co.jboard2.vo.FileVO;

public class FileDownService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String parent = req.getParameter("parent");
		
		BoardDAO dao = BoardDAO.getInstance();
		FileVO vo = dao.getFile(Integer.parseInt(parent));
		
		String path = req.getServletContext().getRealPath("/upload");
		File file = new File(path+"/"+vo.getNewName());

		//파일 다운로드 카운트
		
		//파일명 원복
		if(file.exists()) {
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename="+vo.getOldName()+";");
			resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Pragma", "no-cache");
			resp.setHeader("Cache-Control", "private");
			
			byte b[] = new byte[1024];
			try {
				FileInputStream in = new FileInputStream(file);
				ServletOutputStream out = resp.getOutputStream();
				
				BufferedInputStream bis = new BufferedInputStream(in);
				BufferedOutputStream bos = new BufferedOutputStream(out);
				
				int read = 0;
				
				while(true) {
					read = bis.read(b);
					if(read == -1) {
						break;
					}
					bos.write(b, 0, read);
				}
				bos.flush();
				bos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}	
		return null;
	}
}
