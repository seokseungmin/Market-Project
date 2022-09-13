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
	<h3>등록한 상품 목록</h3><br>
	<form action="deleteProduct.jsp">
	<table style="margin-left: auto; margin-right: auto; text-align:center;" width="800" border="ridge">
		<tr>
			<th>상품번호</th>
			<th>상품이름</th>
			<th>가격</th>
			<th>등록날짜</th>
			<th>선택</th>
			<%
				try{
					ResultSet rs = DB.getLoginedVendorProduct(vLogined.getVid());
					while(rs.next()){
						int pno = rs.getInt("pno");
						String pname = rs.getString("pname");
						int price = rs.getInt("price");
						String enrolDate = rs.getString("enrolDate");
						%>
						<tr>
							<td><%=pno%></td>
							<td><%=pname%></td>
							<td><%=price%></td>
							<td><%=enrolDate%></td>
							<td><input type="radio" name="selectProduct" value="<%=pno%>"></td>
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
		<input type="submit" class="main_button" value="등록삭제">
	</div>
	</form>
	<center><button onclick="location.href='inputProductInfo.jsp'" class="etc_button">상품등록하기</button><button onclick="location.href='checkRequestedOrder.jsp'" class="etc_button">요청주문건확인</button></center>
	</div>
	</body>
</html>