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
	<div id="deliverList" class="etc_window">
	<h2>[배송 조회]</h2><br> 
	<table style="margin-left: auto; margin-right: auto; text-align:center;" width="800" border="ridge">
		<tr>
			<th>송장번호</th>
			<th>보내는 업체</th>
			<th>받는 사람</th>
			<th>도착주소</th>
			<th>발송상품번호</th>
			<th>발송일</th>
			<th>도착예정일</th>
			<th>배송상태</th>
			
			<%
				try{
					ResultSet rs = DB.getLoginedDeliverInfo(c.getCid());
					while(rs.next()){
				//		int dno = rs.getInt("dno");
				//		String vname = DB.getVnameByVid(rs.getString("vid")); // vid 이용해서 vname 가져옴.
				//		String cname = DB.getCnameByCid(rs.getString("cid"));
				//		String arrivalAddress = DB.getAddressByCid(rs.getString("cid"));
				//		String pname = DB.getPnameByPno(rs.getString("pno"));
				//		String sendDate = rs.getString("sendDate");
				//		String arrivalDate = rs.getString("arrivalDate");
				//		String deliveryStatus = rs.getString("deliveryStatus");
						
						int dno = rs.getInt("dno");
						String vname = rs.getString("vname");
						String cname = c.getCname();
						String arrivalAddress = c.getAddress();
						String pno = rs.getString("pno");
						String sendDate = rs.getString("sendDate");
						String arrivalDate = rs.getString("arrivalDate");
						String deliveryStatus = rs.getString("deliveryStatus");
						
						%>
						<tr>
							<td><%=dno%></td>
							<td><%=vname%></td>
							<td><%=cname%></td>
							<td><%=arrivalAddress%></td>
							<td><%=pno%></td>
							<td><%=sendDate%></td>
							<td><%=arrivalDate%></td>
							<td><%=deliveryStatus%></td>
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
	<center><button onclick="location.href='customerLoginSuccess.jsp'" class="etc_button">홈으로</button></center>
	</div>
</body>
</html>