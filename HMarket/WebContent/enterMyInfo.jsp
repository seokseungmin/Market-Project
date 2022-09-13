<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>

<html>
<head>
<title>HMarket</title>
</head>
<body>
	<%	
		Customer c = (Customer)session.getAttribute("loginedCustomer");
		Vendor v = (Vendor)session.getAttribute("loginedVendor");
		
		if(c != null && v == null){
			out.print("<script>window.top.frames[1].location='customer_myInfo.jsp';</script>"); // 메인 페이지 내 정보 화면 출력
			out.print("<script>window.top.frames[0].location='topFrameAfterLogin.jsp';</script>");
		}
		else{
			out.print("<script>window.top.frames[1].location='vendor_myInfo.jsp';</script>"); // 메인 페이지 내 정보 화면 출력
			out.print("<script>window.top.frames[0].location='topFrameAfterLogin.jsp';</script>");
		}
	%>
</body>
</html>