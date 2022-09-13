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
		Customer cLogined = (Customer) session.getAttribute("loginedCustomer");
	%>
	
	<!--  
	<nav>
		<ul class="product_menu">
			<li><h3 id = "category_text">카테고리</h3></li>
			<li><a href="preparing.jsp">전체상품</a></li>
			<li><a href="preparing.jsp">인기상품</a></li>
			<li><a href="preparing.jsp">식품·생필품</a></li>
			<li><a href="preparing.jsp">컴퓨터·디지털·가전</a></li>
			<li><a href="preparing.jsp">스포츠·건강</a></li>
			<li><a href="preparing.jsp">여행·도서</a></li>
			<li><a href="preparing.jsp">패션·의류</a></li>
		</ul>
	</nav>
	-->
	
	<div class="etc_window">
	<h3>구매가능한 상품 목록</h3><br>
	<form action="inputPurchaseInfo.jsp">
	<table style="margin-left: auto; margin-right: auto; text-align:center;" width="800" border="ridge">
		<tr>
			<th>상품번호</th>
			<th>상품이름</th>
			<th>가격</th>
			<th>판매업체 아이디</th>
			<th>등록날짜</th>
			<th>선택</th>
			<%
				try{
					ResultSet rs = DB.getAllProduct();
					while(rs.next()){
						int pno = rs.getInt("pno");
						String pname = rs.getString("pname");
						int price = rs.getInt("price");
						String vid = rs.getString("vid");
						String enrolDate = rs.getString("enrolDate");
						%>
						<tr>
							<td><%=pno%></td>
							<td><%=pname%></td>
							<td><%=price%></td>
							<td><%=vid%></td>
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
		
	</table>
	<br>
	<div style="text-align:center;">
		<input type="submit" class="main_button" value="구매하기">
	</div>
	</form>
	</div>
	</body>
</html>