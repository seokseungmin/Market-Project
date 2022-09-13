<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<%@ include file="vendorMenu.jsp"%>
<html>
	<head>
	<link href="webDesign.css" rel="stylesheet" type="text/css"/>
	<title>HMarket</title>
</head>
	<body>
	<div class="etc_window">
	<h3>상품 정보 입력</h3><br>
		<form action="enrolProduct.jsp" method="post">
       		<input type="text" name="input_pname" placeholder="상품이름 입력" class="etc_text"><br><br>
     		<input type="text" name="input_price" placeholder="가격 입력" class="etc_text"><br><br>
     		<input type="submit" value="등록" class="main_button"><br>
     		<!--<input type="button" onclick="history.back()" value="뒤로가기" class="etc_button">-->
    	</form>
    </div>
	</body>
</html>
