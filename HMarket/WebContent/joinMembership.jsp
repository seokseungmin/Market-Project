<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>
  <head>
    <title>HMarket</title>
  </head>
  <body>
    <%
    String selectRadio = request.getParameter("select");
    String inputID = request.getParameter("input_id");
	String inputPW = request.getParameter("input_pw");
	String inputName = request.getParameter("input_name");
	String inputAddress = request.getParameter("input_address");
	String inputPhoneNo = request.getParameter("input_tel");
	
	if(inputID.equals("") || inputPW.equals("") || inputName.equals("") || inputAddress.equals("") || inputPhoneNo.equals("")){
		out.print("<script>alert('로그인 아이디와 패스워드가 모두 입력되지 않았습니다.')</script>");
   		out.print("<script>history.back()</script>"); // 뒤로가기
   		return;
	}
	
	if(selectRadio == null){
		out.print("<script>alert('고객과 판매업체중에 선택하지 않았습니다.')</script>");
   		out.print("<script>history.back()</script>"); // 뒤로가기
	}
	else if(selectRadio.equals("customer")){ // 고객 회원가입
		String encryptPW = PasswordED.encriptPassword(inputPW); // 암호화
		Customer newC = new Customer(inputID, encryptPW, inputName, inputAddress, inputPhoneNo);
		int cnt = DB.insertCustomerObject(newC);
		if(cnt == 1){
			out.print("<script>alert('회원가입이 완료되었습니다.')</script>");
			out.print("<script>location.href = 'startDisplay.jsp';</script>");
		}
		else{
			out.print("<script>alert('중복되는 아이디가 존재합니다.')</script>");
			out.print("<script>history.back()</script>"); // 뒤로가기
		}
	}
	else{ // 판매업체 회원가입
		String encryptPW = PasswordED.encriptPassword(inputPW); // 암호화
		Vendor newV = new Vendor(inputID, encryptPW, inputName, inputAddress, inputPhoneNo);
		int cnt = DB.insertVendorObject(newV);
		if(cnt == 1){
			out.print("<script>alert('회원가입이 완료되었습니다.')</script>");
			out.print("<script>location.href = 'startDisplay.jsp';</script>");
		}
		else{
			out.print("<script>alert('중복되는 아이디가 존재합니다.')</script>");
			out.print("<script>history.back()</script>"); // 뒤로가기
		}
	}
	
	
    %>
  </body>
</html>
