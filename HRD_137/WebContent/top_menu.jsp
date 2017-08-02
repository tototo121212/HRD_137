<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
header{
		background-color: lime;
		text-align: center;
		color: white;
		border: 1px solid black;
		padding: 30px;
		}
	nav{
		background-color: gray;
		border: 1px solid gray; 
	}
	nav a{
		text-decoration: none;
		color: white;
	}
</style>
</head>
<body>
	<header>쇼핑몰 회원관리 ver 1.0 최진혁</header>
	<nav>
	<a href="${pageContext.request.contextPath}/MyController01">&nbsp;회원등록&nbsp;&nbsp;&nbsp;</a>
	<a href="${pageContext.request.contextPath}/MyController03">회원목록 조회/수정&nbsp;&nbsp;&nbsp;</a>
	<a href="${pageContext.request.contextPath}/MyController04">회원매출조회&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="index.jsp">홈으로...</a>
	</nav>
</body>
</html>