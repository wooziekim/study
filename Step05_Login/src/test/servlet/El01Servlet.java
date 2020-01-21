package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/el01")
public class El01Servlet extends HttpServlet {

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		// request 영역에 "myName" 이라는 키값으로 "김구라" 저장하기
		req.setAttribute("myName", "김구라");
		// jsp 페이지로 forward 이동 (응답을 위임하기)
		RequestDispatcher rd=req.getRequestDispatcher("/el/test01.jsp");
		rd.forward(req,resp);
		
	}
	
}
