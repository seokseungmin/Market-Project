<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<%@ include file="vendorMenu.jsp"%>

<html>
	<head>
		<link href="webDesign.css" rel="stylesheet" type="text/css"/>
		<title>HMarket</title>
	</head>
	<body>
	<%
		Vendor vLogined = (Vendor) session.getAttribute("loginedVendor");
	%>
	<div class="etc_window">
	<h3>[요청 주문건 리스트]</h3><br><br>
	<form action="processDeliver.jsp">
	<table style="margin-left: auto; margin-right: auto; text-align:center;" width="800" border="ridge">
		<tr>
			<th>주문번호</th>
			<th>상품번호</th>
			<th>구매개수</th>
			<th>주문날짜</th>
			<th>결제방법</th>
			<th>선택</th>
			<%
				try{
					ResultSet rs = DB.getRequestedOrder(vLogined.getVid());
					while(rs.next()){
						int orderNo = rs.getInt("orderNo");
						int pno = rs.getInt("pno");
						int orderCount = rs.getInt("orderCount");
						String orderDate = rs.getString("orderDate");
						String paymentMethod = rs.getString("paymentMethod");
						%>
						<tr>
							<td><%=orderNo%></td>
							<td><%=pno%></td>
							<td><%=orderCount%></td>
							<td><%=orderDate%></td>
							<td><%=paymentMethod%></td>
							<td><input type="radio" name="selectOrder" value="<%=orderNo%>"></td>
						</tr>
						<%
					}
				}
				catch(SQLException ex){
					System.err.println("SQL 오류 : " + ex.getMessage());
				}
				
			%>
		</tr>
		
	</table><br><br>
	<div style="text-align:center;">
		<input type="submit" value="배송처리" class="main_button">
	</div>
	</form>
	<!--<center><button onclick="location.href='vendorLoginSuccess.jsp'" class="etc_button">뒤로가기</button></center>-->
	</div>
	</body>
</html>