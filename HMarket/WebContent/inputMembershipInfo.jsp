<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<html>
	<head>
	<link href="webDesign.css" rel="stylesheet" type="text/css"/>
	<title>HMarket</title>
</head>
	<body>
	<div class="etc_window">
		<h3>회원가입</h3><br>
		<form action="joinMembership.jsp" method="post">
			<label><input type="radio" name="select" value="customer">고객</label>
       		<label><input type="radio" name="select" value="vendor">판매업체</label><br><br>
       		<input type="text" name="input_id" placeholder="아이디 입력" class="etc_text"><br><br>
     		<input type="password" name="input_pw" placeholder="패스워드 입력" class="etc_text"><br><br>
     		<input type="text" name="input_name" placeholder="이름 입력" class="etc_text"><br><br>
     		<input type="text" name="input_address" placeholder="주소 입력" class="etc_text"><br><br>
     		<input type="text" name="input_tel" placeholder="전화번호 입력" class="etc_text"><br><br><br>
     		<input type="submit" value="회원가입" class="main_button"><br><br><input type="button" onclick="history.back()" value="뒤로가기" class="etc_button">
    	</form>
    </div>
	</body>
</html>
