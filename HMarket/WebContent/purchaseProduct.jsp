<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>

<html>
<head>

<title>HMarket</title>
</head>
<body>
	<%
		Customer c = (Customer)session.getAttribute("loginedCustomer");
		String loginedCid = c.getCid(); // 로그인한 고객 아이디 가져오기
		int orderNo = DB.getNewPurchaseOrderNo(); // 주문번호 생성
		int pno = (Integer)session.getAttribute("buyPno"); // 세션에 저장해둔 구매할 상품의 상품번호 가져오기
//		int pno = (Integer)request.getAttribute("buyPno"); // 예외 발생 ???
		String pmData = "";
		String nowDate = DateCal.getCurrntTimePlusDay(0); // 현재날짜 저장
		
			
		if(request.getParameter("input_cnt") == null){
			out.print("<script>alert('구매 개수를 입력하세요.')</script>");
		       		out.print("<script>history.back()</script>"); // 뒤로가기
		}
		else if(request.getParameter("paymentMethod").equals("")){
			out.print("<script>alert('결제방식을 선택하세요.')</script>");
		       		out.print("<script>history.back()</script>"); // 뒤로가기
		}
		else{
			session.setAttribute("buyPno", null); // 세션 초기화
			int orderCount = 0;
			String paymentMethod = request.getParameter("paymentMethod");
			try{
				orderCount = Integer.parseInt(request.getParameter("input_cnt"));
			}
			catch(Exception e){
				out.print("<script>alert('숫자를 입력하세요.')</script>");
	       		out.print("<script>history.back()</script>"); // 뒤로가기
	       		return;
			}
			int paymentAmount = DB.calculatePaymentAmount(pno, orderCount);
			if(paymentMethod.equals("card")){ // 신용카드 선택
		pmData = "신용카드";
			}
			else if(paymentMethod.equals("deposit")){ // 무통장입금 선택
		pmData = "무통장입금";
			}
			else{ // 간편결제 선택
		pmData = "간편결제";
			}
			Purchase newP = new Purchase(orderNo, loginedCid, pno, orderCount, paymentAmount, nowDate, pmData, "주문처리전"); // purchase 객체 생성
			DB.insertPurchaseObject(newP); // purchase 테이블에 추가
			out.print("<script>alert('구매 완료했습니다.')</script>");
		    out.print("<script>location.href = 'customerLoginSuccess.jsp';</script>"); // 구매 후 홈화면으로
		}
	%>
</body>
</html>