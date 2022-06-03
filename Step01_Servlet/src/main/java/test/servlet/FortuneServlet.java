package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * [ 서블릿 만드는 방법]
 * 
 * 1. HttpServlet 클래스를 상속 받는다.
 * 2. service() 메소드를 오버라이드 한다.
 * 3. @WebServlet 어노테이션을 이용해서 요청을 맵핑한다.
 */

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//오늘의 운세를 미리 배열에 준비하고
		String[] fortunes= {
				"동쪽으로 가면 귀인을 만나요",
				"로또를 사면 1등이 될거에요.",
				"먹을 복이 있어요",
				"어째....",
				"저째...."
				
		};
		
		
		Random ran = new Random();
						
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정(웹브라우저에게 html 형식의 문자열을 응답할거라고 미리 알린다)
		resp.setContentType("text/html; charset=utf-8");
		
				
		
		//클라이언트에게 출력할 수 있는 객체의 참조값 얻어오기
		PrintWriter pw=resp.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset=\"UTF-8\">");
		pw.println("<title>insert title here</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>오늘의 운세: <strong>"+fortunes[ran.nextInt(5)] +"</strong></p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
	
}
