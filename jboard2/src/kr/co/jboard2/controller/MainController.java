package kr.co.jboard2.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	//������Ʈ ��� �������̽��� ���� �� ����
	private Map<String, Object> instances = new HashMap<>();
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		//��Ʈ�ѷ� �ʱ�ȭ �۾�
		
		
		//commandURI.properties ���ϰ�� ����
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF") + "/commandURI.properties";
		
		
		//commandURI ������ �׼��ּ��� Ŭ������ properties ��ü�� ����
		Properties prop = new Properties(); // map�� ������ �ڷᱸ�� �÷���
		FileInputStream fis = null;
		
		try {
			//commandURI.properties ���ϰ� �Է½�Ʈ�� ����
			fis = new FileInputStream(path);
			
			//�Է½�Ʈ������ command.properties ������ �о� ���̱�
			prop.load(fis);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			
			if(fis != null) {
				try {
					fis.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		//��Ŭ������ ��ü�� �����ؼ� properties�� ����
		Iterator<?> it = prop.keySet().iterator();
		
		while(it.hasNext()) {
			String k = it.next().toString();
			String v = prop.getProperty(k);
			try {
				//prop ��ü�� ����� ���ڿ������� ������ �ش� ��Ű���� �ִ� Ŭ������ ��ü�� ����
				Class<?> obj = Class.forName(v);
				Object instance = obj.newInstance();
				
				instances.put(k, instance);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
	} //init ��
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	private void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String view = null;
		
		// http://localhost:8080/ch18/hello.do
		String root = req.getContextPath();
		String uri = req.getRequestURI();
		//properties���� �����س��� �׼� �ּ�
		String command = uri.substring(root.length());
		
		CommandAction instance = (CommandAction)instances.get(command);
		view = instance.requestProc(req, resp);
		
		if(view.startsWith("redirect:")) {
			String action = view.substring("redirect:".length());
			resp.sendRedirect(action);
		} else if(view.startsWith("json:")) {
			//json:{'result':'1'}
			String json = view.substring("json:".length());
			PrintWriter out = resp.getWriter();
			out.print(json);
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher(view);
			dispatcher.forward(req, resp);			
		}
		
		
	}
	
}
