<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="title"/>
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="/js/extensions.jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="/js/extensions.underscore-min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<style>
.btn-group-lg>.btn, .btn-lg {width:125px; padding: 0.5rem 1rem; margin: 50px; font-size: 1.25rem; line-height: 1.5; border-radius: 0.3rem;} 
#enroll-container{width: 30%; margin:100px;}
.form-control {margin: 5px;}
#button-container {margin-right:-16px;}

/* 회원 가입 */
/* div#enroll-container { width:500px; }
div#enroll-container input, div#enroll-container select { margin-bottom:10px; }
div#enroll-container table th { text-align:right; padding-right:10px; }
div#enroll-container table td { text-align:left; } */


/* 중복아이디체크관련 */
div#memberId-container { position:relative; padding:0px; }
div#memberId-container span.guide { display:none; font-size:12px; position:absolute; top:12px; right:10px; }
div#memberId-container span.ok { color:green; }
div#memberId-container span.error { color:red; }


#mainbutton{text-align:center; margin-top:15px;}
#mainbutton button{display:inline-block; margin: 1.5%; width: 15%;}
</style>
<c:if test="${not empty msg}">
	<script>
		alert('${msg}'); 
	</script>
</c:if>

<div id="mainbutton">
	<button type="button" class="btn btn-outline-primary btn-lg" id="mainbutton1">약관동의</button>
	<button type="button" class="btn btn-outline-primary btn-lg" id="mainbutton2">이메일인증</button>
	<button type="button" class="btn btn-primary btn-lg" id="mainbutton3">회원정보입력</button>
</div>
<div id="enroll-container" class="mx-auto text-center">
	<form:form name="memberCreateFrm" action="${pageContext.request.contextPath}/member/memberCreate2.do" method="POST">
		<table class="mx-auto w-75">
			<tr>
				<th>아이디</th>
				<td>
					<div id="memberId-container">
						<input type="text" 
							   class="form-control" 
							   placeholder="4글자이상"
							   name="memberId" 
							   id="memberId"
							   value="eogh"
							   pattern="\w{4,}"
							   required>
						<span class="guide ok">이 아이디는 사용가능합니다.</span>
						<span class="guide error">이 아이디는 이미 사용중입니다.</span>
						<input type="hidden" id="idValid" value="0"/>
					</div>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" class="form-control" name="memberPwd" id="password" value="eogh" required>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td>	
					<input type="password" class="form-control" id="passwordConfirmation" value="eogh" required>
				</td>
			</tr>  
			<tr>
				<th>이름</th>
				<td>	
					<input type="text" class="form-control" name="memberName" id="name" value="황대호" required>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>	
					<input type="phone" class="form-control" name="memberPhone" id="phone" value="010-1234-1234"/>
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" class="form-control" placeholder="abc@xyz.com" name="email" id="email" value="${email}" readonly>
				</td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td>	
					<input type="date" class="form-control" name="birthday" id="birthday" value="1996-06-06"/>
				</td>
			</tr>
			
			<!-- <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
				  <label class="btn btn-outline-primary" for="btnradio1">자바</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
				  <label class="btn btn-outline-primary" for="btnradio2">정보보안전문가</label>
				
			</div> --> 
		</table>
		<div id="button-container">
			<input class="btn btn-primary btn-lg" type="submit" value="Submit">
			<input class="btn btn-primary btn-lg" type="reset" value="Reset">
		</div>
	</form:form>
</div>
<script>
document.querySelector("#memberId").onkeyup = (e) => {
	const value = e.target.value;
	console.log(value);
	
	const guideOk = document.querySelector(".guide.ok");
	const guideError = document.querySelector(".guide.error");
	const idValid = document.querySelector("#idValid");
	
	if(value.length >= 4) {
		$.ajax({
			url : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
			data : {
				memberId : value
			},
			method : "GET",
			dataType : "json",
			success(responseData) {
				console.log(responseData);
				const {available} = responseData;
				if(available) {
					guideOk.style.display = "inline";
					guideError.style.display = "none";
					idValid.value = "1";
				}
				else {
					guideOk.style.display = "none";
					guideError.style.display = "inline";
					idValid.value = "0";
				}
				
			}
		});
	}
	else {
		guideOk.style.display = "none";
		guideError.style.display = "none";
		idValid.value = "0";
	}
};

document.memberCreateFrm.onsubmit = (e) => {
	const idValid = document.querySelector("#idValid");
	const password = document.querySelector("#password");
	const passwordConfirmation = document.querySelector("#passwordConfirmation");

	
	if(idValid === "0") {
		alert("사용가능한 아이디를 작성해주세요.");
		return false;
	}
	
	
	if(password.value !== passwordConfirmation.value) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	if(password.value !== passwordConfirmation.value) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
};
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
