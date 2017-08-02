<%@page import="DBPKG.PVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table tr,th,td{
		border: 1px solid black;
		text-align: center;
		padding: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="top_menu.jsp" />
		<div align="center">
		<%List<PVO>list2 =(List)request.getAttribute("list2"); %>
			<h2>회원매출조회</h2>
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
			</thead>
			<tbody>
			<%for(PVO k : list2){ %>
				<tr>
					<td><%=k.getCustno() %></td>
					<td><%=k.getCustname() %></td>
					<td><%=k.getGrade() %></td>
					<td><%=k.getPrice()%></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>	
	<jsp:include page="bottom.jsp" />
</body>
</html>