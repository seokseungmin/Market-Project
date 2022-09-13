<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*,hmarket_package.*"%>
<html>
	<head>
		<link href="webDesign.css" rel="stylesheet" type="text/css"/>
		<title>HMarket</title>
		<style>
			#myInfoBtn{
				margin-right: -4px;
			}
			#logoutBtn{
				margin-left: -3px;
			}
			#btn_group{
				text-align: right;
			}
		</style>
	</head>
	<body>
		<!--<h1 style="color:green; text-align:center">HMarket</h1>-->
		<div style="text-align:center; image-rendering: -webkit-optimize-contrast;">
			<img src="images/logo.png" alt="logo" width="180" height="60">
		</div>
		<div id="btn_group">
			<button id="myInfoBtn" onclick="location.href='enterMyInfo.jsp'" class="small_etc_button">내 정보</button>
			<button id="logoutBtn" onclick="location.href='logout.jsp'" class="small_etc_button">로그아웃</button>
		</div>
	</body>
</html>