package kr.co.jboard2.service;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;
import kr.co.jboard2.vo.BoardVO;

public class WriteService implements CommandAction {

	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String method = req.getMethod();

		//작성완료 버튼을 눌렀을 때
		if(method.equals("POST")) {
			// 첨부된 파일이 있으면 upload 디렉터리에 파일저장
			// 개발환경 : C:\Users\java.user-PC\Dropbox\java\workspace\jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jboard2\ upload
			// 리얼서버 : /home/zeroam/jboard2/upload
			String path = req.getServletContext().getRealPath("/upload");
			int maxSize = 1024*1024*10; //10MB
			
			MultipartRequest mr = null;
			try {
				mr = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//게시판 vo 객체 생성 및 초기화		
			BoardVO vo = new BoardVO();
			vo.setCate(mr.getParameter("cate"));
			vo.setTitle(mr.getParameter("subject"));
			vo.setContents(mr.getParameter("content"));
			vo.setUid(mr.getParameter("uid"));
			vo.setFile(0);
			vo.setRegip(req.getRemoteAddr());

			String uid = mr.getParameter("uid");
			String file = mr.getFilesystemName("file");
			
			if(file != null) {
				vo.setFile(1);
			}
			
			//데이터 베이스에 글 등록
			BoardDAO dao = BoardDAO.getInstance();
			int seq = dao.write(vo);
			
			//파일 첨부 했을 때
			if(file != null) {
				//파일명 수정하기
				String uuid = makeUUID(file, uid);
				try {
					updateFileName(path, file, uuid);
				} catch (Exception e) {
					e.printStackTrace();
				}
				//파일 정보 데이터 베이스에 등록
				dao.insertFile(seq, file, uuid);
			}
			
			
			return "redirect:/jboard2/list.do";	
		} else {
			return "/write.jsp";				
		}	
	} // requestProc 끝
	
	public String makeUUID(String file, String uid) {
		// 확장자 구하기
		int idx = file.lastIndexOf(".");
		String ext = file.substring(idx);
		
		// 현재 날짜 구하기
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String now = sdf.format(date);
		
		// 파일명 만들기 180928101716_jcw.xlsx
		String fileName = now+"_"+uid+ext;
		
		return fileName;
	}
	
	public void updateFileName(String path, String oldName, String newName) throws Exception {
		
		long fileSize = 0;
		byte[] buf = new byte[1024];
		
		FileInputStream input = null;
		FileOutputStream output = null;
		
		File oldFile = new File(path+"/"+oldName);
		File newFile = new File(path+"/"+newName);
		
		if(!oldFile.renameTo(newFile)) {
			// 파일명 변경이 실패 했을 경우
			// 스트림연결을 통한 직접 파일쓰기 작업
			input = new FileInputStream(oldFile);
			output = new FileOutputStream(newFile);
			
			int read = 0;
			while(true) {
				read = input.read(buf, 0, buf.length);
				
				if(read == -1) {
					break;
				}
				
				output.write(buf, 0, read);
			}
			input.close();
			output.close();
			oldFile.delete();
		}
		
	}
}
