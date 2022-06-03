package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send2")
public class SendServlet2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		
		//post 방식 전송했을 때 문자열 추출하기 전에 한글 깨지지 않도록 인코딩 설정
		req.setCharacterEncoding("utf-8");
		
		//클라이언트가 전송한 요청 파라미터 추출하기
		Object msg= req.getParameter("msg");
		System.out.println("전송된 문자열:"+msg);
		
				
		//간단한 임시 응답
		PrintWriter pw=resp.getWriter();
		pw.println(msg);
		pw.close();
		
		
	}
}
