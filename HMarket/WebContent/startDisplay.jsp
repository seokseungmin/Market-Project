<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<html>
  <head>
 	<link href="webDesign.css" rel="stylesheet" type="text/css"/>
    <title>HMarket</title>
  </head>
  <body class="start_background">
    <% DB.getConnection(); %>
    <center><div id = "login_form">
      <form action="login.jsp">
        <input type="text" name="input_id" placeholder="아이디를 입력하세요" class="login_text"><br><br>
        <input type="password" name="input_pw" placeholder="패스워드를 입력하세요" class="login_text"><br><br>
        <label><input type="radio" name="select" value="customer">고객</label>
        <label><input type="radio" name="select" value="vendor">판매업체</label><br><br>
        <input type="submit" value="로그인" class="main_button"><br>
      </form>
      <button onclick="location.href='inputMembershipInfo.jsp'" class="small_etc_button">회원가입</button>
      <input type="button" class="small_etc_button" value="아이디/비밀번호 찾기">  <!-- 아직 구현 안됨 -->
    </div></center>
  </body>
</html>