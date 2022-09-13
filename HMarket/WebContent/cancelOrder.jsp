<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>

<html>
<head>
<title>HMarket</title>
</head>
<body>
	<%
		String selectedOrder = request.getParameter("selectOrder");
		if(selectedOrder == null){ // 취소할 주문을 선택 안했을 경우
			out.print("<script>alert('취소할 주문을 선택하지 않았습니다.')</script>");
   			out.print("<script>history.back()</script>");
		}
		else{
			int orderNo = Integer.parseInt(selectedOrder); // 선택된 주문번호를 가져옴 (int형으로 Cast)
			boolean isBefore = DB.isBeforeProcessOrder(orderNo);
			if(isBefore == true){
				int cnt = DB.insertCanceledPurchaseObject(orderNo); // 삭제 전, 주문정보 취소테이블에 저장
				DB.deletePurchaseObject(orderNo); // 주문 정보 삭제
				
				if(cnt == 1){ // 성공적으로 삽입
					out.print("<script>alert('주문 취소가 완료되었습니다.')</script>");
					out.print("<script>location.href = 'checkOrder.jsp';</script>"); // 새로고침을 위해 뒤로가기말고 새 링크를 불러온다.
				}
				else{
					out.print("<script>alert('예기치 못한 오류가 발생하였습니다.')</script>");
		   			out.print("<script>history.back()</script>");
				}
			}
			else{
				out.print("<script>alert('이미 발송된 상품의 주문건은 취소가 불가능 합니다. 판매업체에 문의하세요.')</script>");
	   			out.print("<script>history.back()</script>");
			}
		}
		
	%>
</body>
</html>