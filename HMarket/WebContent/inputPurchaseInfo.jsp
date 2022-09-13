<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<%@ include file="customerMenu.jsp"%>
<html>
<head>
<link href="webDesign.css" rel="stylesheet" type="text/css"/>
<title>HMarket</title>
</head>
<body>
	<div class="etc_window">
	<%
		String selectRadio = request.getParameter("selectProduct");
		int pno = 0;
		
		if(selectRadio == null){
			out.print("<script>alert('상품을 선택하세요.')</script>");
			out.print("<script>history.back()</script>");
		}
		else{
			pno = Integer.parseInt(request.getParameter("selectProduct"));
			session.setAttribute("buyPno", pno); // 구매할 상품의 pno를 세션에 저장
//			request.setAttribute("buyPno", pno);
			try{
				ResultSet rs = DB.getProductByPno(pno);
				%><h3>구매할 상품정보</h3><br><br><br><%
				while(rs.next()){
					out.print("상품번호 : " + rs.getInt("pno"));%><br><br><%
					out.print("상품이름 : " + rs.getString("pname"));%><br><br><%
					out.print("상품가격 : " + rs.getInt("price"));%><br><br><%
					out.print("판매업체아이디 : " + rs.getString("vid"));%><br><br><%
					out.print("등록날짜 : " + rs.getString("enrolDate"));%><br><br><%
				}
			}
			catch(SQLException ex){
				System.err.println("SQL 오류 : " + ex.getMessage());
			}
			%>
			<br><br>
			<form action="purchaseProduct.jsp" method="post">
				<input type="text" name="input_cnt" placeholder="구매개수" class="input_count_text"><br><br>
				<select name="paymentMethod">
    				<option value="">결제방법</option>
    				<option value="card">신용카드</option>
    				<option value="deposit">무통장입금</option>
   					<option value="easy">간편결제</option>
				</select><br><br>
				<input type="submit" value="구매하기" class="main_button">
			</form>
			<button type="button" onclick="history.back()" class="etc_button">뒤로가기</button>
			</div>
			<%
		}
	%>
</body>
</html>