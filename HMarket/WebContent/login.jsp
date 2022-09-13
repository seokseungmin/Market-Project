<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<html>
  <head>
    <title>HMarket</title>
  </head>
  <body>
    <%
    	String inputID = request.getParameter("input_id");
   		String inputPW = request.getParameter("input_pw");
   		session.setAttribute("plainPassword", inputPW); // 로그인한 사용자의 암호화 하기 전의 패스워드를 세션에 저장
   		String encryptPW = PasswordED.encriptPassword(inputPW); // 암호화
   		String selectRadio = request.getParameter("select");
   		
   		if (inputID.equals("") || inputPW.equals("")) { // 아이디와 패스워드 입력하지 않았을 경우
       		out.print("<script>alert('로그인 아이디와 패스워드가 모두 입력되지 않았습니다.')</script>");
       		out.print("<script>history.back()</script>"); // 뒤로가기
       		//response.sendRedirect("startDisplay.jsp"); // 경고창이 안뜨게 되는 오류 발생
        }
   		
   		else if(selectRadio == null){ // 라디오 버튼 선택하지 않았을 경우
   			out.print("<script>alert('고객과 판매업체중 선택하지 않았습니다.')</script>");
   			out.print("<script>history.back()</script>");
   		}
   		
   		else{
   			if(selectRadio.equals("customer")){ // 고객 로그인
   	    		Customer cLogined = DB.searchCustomer(inputID, encryptPW);
   	    		
   	    		if(cLogined == null){
   	    			//로그인 실패
   	    			out.print("<script>alert('로그인에 실패하였습니다.')</script>");
   	    			out.print("<script>history.back()</script>");
   	    		}
   	    		else{
   	    			//로그인 성공
   	    			session.setAttribute("loginedCustomer", cLogined);
   	    			out.print("<script>window.top.frames[0].location='topFrameAfterLogin.jsp';</script>"); // mainFrame에서는 topFrame먼저 호출
   	    			out.print("<script>window.top.frames[1].location='customerLoginSuccess.jsp';</script>");
   	    		}
   	    	}
   	    	else if(selectRadio.equals("vendor")){ // 판매업체 로그인
   	    		Vendor vLogined = DB.searchVendor(inputID, encryptPW);
   	    		if(vLogined == null){
   	    			//로그인 실패
   	    			out.print("<script>alert('로그인에 실패하였습니다.')</script>");
   	    			out.print("<script>history.back()</script>");
   	    		}
   	    		else{
   	    			//로그인 성공
   	    			session.setAttribute("loginedVendor", vLogined);
   	    			session.setAttribute("isLogined", true);
   	    			out.print("<script>window.top.frames[0].location='topFrameAfterLogin.jsp';</script>");
   	    			out.print("<script>window.top.frames[1].location='vendorLoginSuccess.jsp';</script>");
   	    		}
   	    	}
   		}
    %>
  </body>
</html>