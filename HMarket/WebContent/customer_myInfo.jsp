<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<%@ include file="customerMenu.jsp" %>
<html>
<head>
<link href="webDesign.css" rel="stylesheet" type="text/css"/>
<title>HMarket</title>
</head>
<body>
<div class="etc_window">
	<%
		Customer c = (Customer)session.getAttribute("loginedCustomer");
		Vendor v = (Vendor)session.getAttribute("loginedVendor");
		String pw = (String)session.getAttribute("plainPassword"); // 평문 패스워드를 세션에서 가져옴
		
		%>
			<h2>[내 정보]</h2><br> 
			아이디 : <%=c.getCid()%><br><br> 
			패스워드 : <%=pw%><br><br> 
			이름 : <%=c.getCname()%><br><br> 
			주소 : <%=c.getAddress()%><br><br> 
			연락처 : <%=c.getPhoneNo()%><br><br><br>
			<button onclick="location.href='checkOrder.jsp'" class="etc_Button">주문조회</button>
			<button onclick="location.href='customerLoginSuccess.jsp'" class="etc_Button">홈으로</button>
		<%
		
	%>
</div>
</body>
</html>