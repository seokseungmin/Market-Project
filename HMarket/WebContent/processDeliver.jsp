<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>

<html>
<head>

<title>HMarket</title>
</head>
<body>
	<%
		String orderNoS = request.getParameter("selectOrder");
			
		if(orderNoS == null){
			out.print("<script>alert('주문건을 선택하세요.')</script>");
		       		out.print("<script>history.back()</script>"); // 뒤로가기
		}
		else{
			int orderNo =  Integer.parseInt(orderNoS);
			Vendor v = (Vendor)session.getAttribute("loginedVendor");
			String loginedVid = v.getVid(); // 로그인한 업체 아이디 가져오기
			int dno = DB.getNewDeliverNo(); // 주문번호 생성
			String cid = DB.getCidByOrderNo(orderNo); // 주문한 고객아이디 가져오기
			int pno = DB.getPnoByOrderNo(orderNo);
			String sendDate = DateCal.getCurrntTimePlusDay(0);
			String arrivalDate = DateCal.getCurrntTimePlusDay(3); // 현재날짜 저장
			String deliveryStatus = "배송시작";
			
			Deliver newD = new Deliver(dno, loginedVid, cid, pno, sendDate, arrivalDate, deliveryStatus);
			int cnt = DB.insertDeliverObject(newD);
			if(cnt == 1){
		DB.updateOrderStatus(orderNo);
		out.print("<script>alert('배송처리 완료하였습니다.')</script>");
		out.print("<script>location.href = 'checkRequestedOrder.jsp';</script>");
			}
			else{
		out.print("<script>alert('배송처리에 실패하였습니다.')</script>");
			       		out.print("<script>history.back()</script>"); // 뒤로가기
			}
		}
	%>
</body>
</html>