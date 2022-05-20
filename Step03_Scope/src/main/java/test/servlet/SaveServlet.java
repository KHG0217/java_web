package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/test/save")
public class SaveServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setCharacterEncoding("utf-8");
		String nick=req.getParameter("nick");
		
		//HttpSession 객체에 "nick" 이라는 키값으로 입력한 닉네임을 저장하려고 하는데...
		HttpSession session=req.getSession();
		session.setAttribute("nick", nick);
		session.setMaxInactiveInterval(60);
		
		//근데 html 응답하기가 귀찮; jsp가 응답좀;
		//forward 이동은 서버내의 이동이기 떄문에 /WEB-INF/라는 보안 폴더안에 jsp페이지로도 이동가능하다.
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/views/monkey.jsp");
		rd.forward(req, resp);
		
	}
}
