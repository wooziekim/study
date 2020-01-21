package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import test.users.dto.UsersDto;

@WebServlet("/el02")
public class El02Servlet extends HttpServlet{

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		UsersDto dto=new UsersDto();
		dto.setId("kimgura");
		dto.setEmail("aaa@naver.com");
		// request 영역에 dto 담기
		req.setAttribute("dto", dto);
		// jsp 페이지로 forward 이동 (!동일한 프로젝트에서만 포워드 이동이 가능하다)
		RequestDispatcher rd=req.getRequestDispatcher("/el/test02.jsp");
		rd.forward(req, resp);
		
		
		
	}
	
}
