<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<html>
<head>
<title>HMarket</title>
</head>
<body>
	<%
		session.setAttribute("loginedCustomer", null);
		session.setAttribute("loginedVendor", null);
		session.setAttribute("plainPassword", null);
		
		out.print("<script>window.top.frames[1].location='startDisplay.jsp';</script>"); // topFrame에서는 mainFrame먼저 호출
		out.print("<script>window.top.frames[0].location='topFrame.jsp';</script>");
	%>
</body>
</html>