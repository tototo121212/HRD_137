<%@page import="DBPKG.VO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		padding: 20px;
	}
	table tr,th,td{
		border: 1px solid black;
		text-align: center;
		padding: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="top_menu.jsp" />
	<h2 align="center">회원목록조회/수정</h2>
	<div align="center">
	<%List<VO>list = (List)request.getAttribute("list");%>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
		</thead>
		<tbody>
		
		<%
		String res = "";
		for(VO k : list){ %>
			<tr>
				<td><a href="${pageContext.request.contextPath}/MyController05?custno=<%=k.getCustno()%>"><%=k.getCustno() %></a></td>
				<td><%=k.getCustname()%></td>
				<td><%=k.getPhone() %></td>
				<td><%=k.getAddress() %></td>
				<td><%=k.getJoindate().substring(0,10) %></td>
				<%if(k.getGrade().equalsIgnoreCase("A")){%>
					<td><%=res="VIP"%></td>
				<%}else if(k.getGrade().equalsIgnoreCase("B")){%>	
					<td><%=res="일반"%></td>
				<%}else{ %>
					<td><%=res="직원"%></td>
				<%} %>	
				<td><%=k.getCity()%></td>
			</tr>
		<%} %>
		</tbody>	
	</table>
	</div>
	<jsp:include page="bottom.jsp" />
</body>
</html>