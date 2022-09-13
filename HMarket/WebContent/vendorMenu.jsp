<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<html>
<head>
<title>HMarket</title>
</head>
<body>
<%
	// isNew()  메서드를 이용해 최초세션설정을 확인하고 있다.
//	if(session.isNew()) {
//		out.println("<script> alert('세션이 해제되어 로그아웃 됩니다.') </script>");
//		out.print("<script>location.href = 'logout.jsp';</script>");
//	}
%>
	<nav>
		<ul class="v_menu">
			<li><a href="vendorLoginSuccess.jsp">등록상품 내역</a></li>
			<li><a href="inputProductInfo.jsp">상품 등록하기</a></li>
			<li><a href="checkRequestedOrder.jsp">요청 주문 확인</a></li>
			<li><a href="vendor_myInfo.jsp">내 정보 조회</a></li>
			<li><a href="preparing.jsp">QnA</a></li>
			<li><a href="serviceCenter.jsp">고객센터</a></li>
		</ul>
	</nav>
</body>
</html>