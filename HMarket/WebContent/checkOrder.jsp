<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<%@ include file="customerMenu.jsp" %>
<html>
<head>
<link href="webDesign.css" rel="stylesheet" type="text/css"/>
<title>HMarket</title>
</head>
<body>
	<%
		Customer c = (Customer)session.getAttribute("loginedCustomer");	
	%>
	
	<div class="etc_window">
	<h2>[주문 조회]</h2><br> 
	<form action="cancelOrder.jsp">
	<table style="margin-left: auto; margin-right: auto; text-align:center;" width="800" border="ridge">
		<tr>
			<th>주문번호</th>
			<th>상품이름</th>
			<th>구매개수</th>
			<th>결제금액</th>
			<th>주문날짜</th>
			<th>결제방식</th>
			<th>주문처리상태</th>
			<th>선택</th>
			<%
				try{
					ResultSet rs = DB.getLoginedPurchaseInfo(c.getCid());
					while(rs.next()){
						int orderNo = rs.getInt("orderNo");
						String pname = rs.getString("pname");
						int orderCount = rs.getInt("orderCount");
						int paymentAmount = rs.getInt("paymentAmount");
						String orderDate = rs.getString("orderDate");
						String paymentMethod = rs.getString("paymentMethod");
						String orderStatus = rs.getString("orderStatus");
						%>
						<tr>
							<td><%=orderNo%></td>
							<td><%=pname%></td>
							<td><%=orderCount%></td>
							<td><%=paymentAmount%></td>
							<td><%=orderDate%></td>
							<td><%=paymentMethod%></td>
							<td><%=orderStatus%></td>
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
		
	</table>
	<br>
	<div style="text-align:center;">
		<input type="submit" value="주문취소" class="main_button"> <!-- 이미 주문처리완료된 주문건은 취소 불가하도록 작성할 것 -->
	</div>
	</form>
	<center><button onclick="location.href='checkDeliver.jsp'" class="etc_button">배송조회</button>
	<button onclick="location.href='customerLoginSuccess.jsp'" class="etc_button">홈으로</button></center>
	</div>
</body>
</html>