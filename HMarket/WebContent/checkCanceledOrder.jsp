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
	<h2>[취소 주문 조회]</h2><br> 
	<form action="cancelOrder.jsp">
	<table style="margin-left: auto; margin-right: auto; text-align:center;" width="800" border="ridge">
		<tr>
			<th>취소날짜</th>
			<th>취소상태</th>
			<th>상품이름</th>
			<th>주문개수</th>
			<th>결제금액</th>
			<th>주문날짜</th>
			<th>결제방식</th>
			<%
				try{
					ResultSet rs = DB.getLoginedCanceledPurchaseInfo(c.getCid());
					while(rs.next()){
						String cancelDate = rs.getString("cancelDate");
						String cancelResult = rs.getString("cancelResult");
						String pname = rs.getString("pname");
						int orderCount = rs.getInt("orderCount");
						int paymentAmount = rs.getInt("paymentAmount");
						String orderDate = rs.getString("orderDate");
						String paymentMethod = rs.getString("paymentMethod");
						%>
						<tr>
							<td><%=cancelDate%></td>
							<td><%=cancelResult%></td>
							<td><%=pname%></td>
							<td><%=orderCount%></td>
							<td><%=paymentAmount%></td>
							<td><%=orderDate%></td>
							<td><%=paymentMethod%></td>
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
	</form>
	<button onclick="location.href='customerLoginSuccess.jsp'" class="etc_button">홈으로</button></center>
	</div>
</body>
</html>