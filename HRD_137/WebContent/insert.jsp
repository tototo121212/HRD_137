<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		
	}
	
	table tr td {
		border: 1px solid black;
		text-align: center;
		padding: 2px;
	}
</style>
<script type="text/javascript">
	var custname = document.getElementById("custname");
	var phone = document.getElementById("phone");
	var address = document.getElementById("address");
	var grade = document.getElementById("grade");
	var city = document.getElementById("city");
	function insert_go(f) {
	if(f.custname.value==""){
		alert("회원성명을 입력해주세요.");
		f.custname.focus();
	}else if(f.phone.value==""){
		alert("회원전화를 입력해주세요.");
		f.phone.focus();
	}else if(f.address.value==""){
		alert("회원주소를 입력해주세요.");
		f.address.focus();
	}else if(f.grade.value==""){
		alert("고객등급를 입력해주세요.");
		f.grade.focus();
	}else if(f.city.value==""){
		alert("도시코드를 입력해주세요.");
		f.city.focus();
	}else{
		f.action = "${pageContext.request.contextPath}/MyController02";
		f.submit();
		alert("가입 되었습니다.");
	}	
}
</script>
</head>
<body>
	<%String res = (String)request.getAttribute("res"); %>
	<%String res2 = (String)request.getAttribute("res2"); %>
	<%if(res2=="1"){%>
		<script type="text/javascript">
			alert("가입 되었습니다.");
			location.href="modify.jsp";
		</script>
	<% }else if(res2 =="0"){%>
		<script type="text/javascript">	
			alert("가입이 실패 되었습니다.");
			history.go(-1);
		</script>
	<%}else if(res2 ==null){%>
		<jsp:include page="top_menu.jsp" />
	<form method="post">	
		<h2 align="center">홈쇼핑 회원 등록</h2>
		<div align="center">
		<table>
			<tr>
				<td>회원번호(자동발생)</td>
				<td><input type="text" id="custno" name="custno" value="<%=res%>"></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" id="custname" name="custname"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" id="phone" name="phone"></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" id="address" name="address"></td>
			</tr>
			<tr>
          		<%-- <%java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
          		String today = formatter.format(new java.util.Date());%> --%>
          		<%SimpleDateFormat formatter= new SimpleDateFormat("yyyyMMdd");
          		String today = formatter.format(new Date());%>
				<td>가입일자</td>
				<td><input type="text" id="joindate" name="joindate" value="<%=today%>"></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP,B:일반,C:직원]</td>
				<td><input type="text" id="grade" name="grade"></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" id="city" name="city"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="등록" onclick="insert_go(this.form)" />
					<input type="button" value="조회" onclick="" />
				</td>
			</tr>
		</table>
	</form>	
	</div>
	<jsp:include page="bottom.jsp" />
	
	<%} %>
</body>
</html>