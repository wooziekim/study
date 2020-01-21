<%@page import="com.sun.corba.se.spi.orbutil.fsm.Input"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//목적지 정보
	String url=request.getParameter("url");
	if(url==null){
		url=request.getContextPath()+"/index.jsp";
	}
	//목적지 정보를 미리 인코딩 해 놓는다.
	String encodedUrl=URLEncoder.encode(url);

	//1. 폼 전송되는 아이디, 비밀번호를 읽어와서
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//2. DB 에서 유효한 정보인지를 확인해서 
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid=UsersDao.getInstance().isValid(dto);
	//3. 유효한 정보이면 로그인 처리를 하고 유효한 정보가 아니면 다시 로그인을 할수 있도록 한다.
	if(isValid){
		//로그인 되었다는 의미에서 session 에 "id" 라는 키값으로 아이디를 저장한다.
		session.setAttribute("id", id);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  	$(function () {
  		$("#dialog").dialog();
  		
  	});
  
  
  </script>
</head>
<body>
<div id="dialog" title="로그인 페이지입니다.">

	<%if(isValid){ %>
		<p><%=id %>님 방문을 환영합니다.</p>
		<script>location.href="<%=url %>" </script>
		
		
	<%}else{ %>
		<p>아이디 혹은 비밀번호를 다시 확인하세요.</p>
	<script>location.href="loginform.jsp?url=<%=encodedUrl %>"</script>
	<%} %>
</div>
</body>
</html>






