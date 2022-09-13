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
		<ul class="c_menu">
			<li><a href="customerLoginSuccess.jsp">전체 상품</a></li>
			<li><a href="customer_myInfo.jsp">내 정보 조회</a></li>
			<li><a href="checkOrder.jsp">전체 주문 내역</a></li>
			<li><a href="checkCanceledOrder.jsp">주문 취소 내역</a></li>
			<li><a href="checkDeliver.jsp">배송 조회</a></li>
			<li><a href="preparing.jsp">쿠폰</a></li>
			<li><a href="preparing.jsp">나의 관심</a></li>
		</ul>
	</nav>
</body>
</html>