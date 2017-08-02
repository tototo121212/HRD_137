<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript">
	function modify_do(f) {
		var custname = document.getElementById("custname");
		var phone = document.getElementById("phone");
		var address = document.getElementById("address");
		var grade = document.getElementById("grade");
		var city = document.getElementById("city");
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
		f.action="${pageContext.request.contextPath}/MyController06";
		f.submit();
		}
	}
</script>
</head>
<body>
		<jsp:include page="top_menu.jsp" />
	<form method="post">	
		<h2 align="center">홈쇼핑 회원 등록</h2>
		<div align="center">
		<table>
			<tr>
				<td>회원번호</td>
				<td><input type="text" id="custno" name="custno" value="${vo.custno}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" id="custname" name="custname"placeholder="${vo.custname}"></td>
			</tr>
			<tr>
				<td>회원전화</td>
				<td><input type="text" id="phone" name="phone" placeholder="${vo.phone}" /></td>
			</tr>
			<tr>
				<td>회원주소</td>
				<td><input type="text" id="address" name="address" placeholder="${vo.address}"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" id="joindate" name="joindate" placeholder="${vo.joindate}"></td>
			</tr>
			<tr>
				<td>고객등급[A:VIP,B:일반,C:직원]</td>
				<td><input type="text" id="grade" name="grade" placeholder="${vo.grade}" ></td>
			</tr>
			<tr>
				<td>도시코드</td>
				<td><input type="text" id="city" name="city" placeholder="${vo.city}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="수정" onclick="modify_do(this.form)" />
					<input type="button" value="조회" onclick="" />
				</td>
			</tr>
		</table>
	</form>	
	</div>
	<jsp:include page="bottom.jsp" />
</body>
</html>