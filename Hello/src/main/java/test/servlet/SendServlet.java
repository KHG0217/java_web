package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class SendServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//폼 전송되는 msg라는 피라미터명으로 전달되는 문자열 추출하기
		String msg = req.getParameter("msg");
		
		System.out.println(msg);
		
		PrintWriter pw=resp.getWriter();
		pw.println("oh!!!");
		pw.println("who are you?");
		pw.close();
	}
}
