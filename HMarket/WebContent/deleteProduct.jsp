<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>

<html>
<head>
<title>HMarket</title>
</head>
<body>
	<%
		String selectedProduct = request.getParameter("selectProduct");
		if(selectedProduct == null){ // 삭제할 상품을 선택 안했을 경우
			out.print("<script>alert('삭제할 상품을 선택하지 않았습니다.')</script>");
   			out.print("<script>history.back()</script>");
		}
		else{
			int pno = Integer.parseInt(selectedProduct); // 선택된 상품번호를 가져옴 (int형으로 Cast)
//			int cnt = DB.insertDeletedPurchaseObject(pno); // 삭제 전, 상품정보 삭제테이블에 저장 ??
			int cnt = DB.deleteProductObject(pno); // 상품 정보 삭제
				
			if(cnt == 1){ // 성공적으로 삭제
				out.print("<script>alert('상품 삭제가 완료되었습니다.')</script>");
				out.print("<script>location.href = 'vendorLoginSuccess.jsp';</script>");
			}
			else{
				out.print("<script>alert('예기치 못한 오류가 발생하였습니다.')</script>");
		   		out.print("<script>history.back()</script>");
			}
		}
	%>
</body>
</html>