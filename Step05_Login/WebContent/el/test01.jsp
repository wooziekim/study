<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/el01/test01.jsp</title>
</head>
<body>
<h3>EL 테스트중...</h3>
<%
	String myName=(String)request.getAttribute("myName");

%>
<p>myName : <strong><%=myName %></strong></p>
<%--위의 코드는 아래의 EL 로 대체 할 수 있다. --%>
<p>myName : <strong>${requestScope.myName }</strong></p>
</body>
</html>


