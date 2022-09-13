<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>
  <head>
    <title>HMarket</title>
  </head>
  <body>
    <%
    	Vendor v = (Vendor)session.getAttribute("loginedVendor");
                    String inputPname = request.getParameter("input_pname");
                	String inputPrice = request.getParameter("input_price");
                	
                	if(inputPname.equals("") || inputPrice.equals("")){
                		out.print("<script>alert('상품정보를 입력해주세요.')</script>");
                   		out.print("<script>history.back()</script>"); // 뒤로가기
                	}
                	
                	else {
                		int price = 0;
                		try{
                			price = Integer.parseInt(inputPrice);
                		}
                		catch(Exception e){
                			out.print("<script>alert('숫자를 입력하세요.')</script>");
            	       		out.print("<script>history.back()</script>"); // 뒤로가기
            	       		return;
                		}
                		Product newP = new Product(DB.getNewProductNo(), inputPname, price, v.getVid(), DateCal.getCurrntTimePlusDay(0));
                		
                		int cnt = DB.insertProductObject(newP);
                		if(cnt == 1){
                	out.print("<script>alert('상품을 등록하였습니다.')</script>");
                	out.print("<script>location.href = 'vendorLoginSuccess.jsp';</script>");
                		}
                		else{
                	out.print("<script>alert('상품등록에 실패하였습니다.')</script>");
                	out.print("<script>history.back()</script>"); // 뒤로가기
                		}
                	}
    %>
  </body>
</html>
