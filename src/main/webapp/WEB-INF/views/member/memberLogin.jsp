<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css" />
<style>
@font-face {
    font-family: 'MBC1961GulimM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.loginContainer {
	width: 40%;
	text-align: center;
	margin : 3% auto;
	padding: 30px;
	border: 1px solid #4870ef;
	border-radius: 30px;
}
#kakao{width:60%; display: inline-block; margin: 3% 0;}
#loginTitle{font-size: 60px; font-family: 'MBC1961GulimM'; font-weight: bold; color : #4870ef; text-shadow: 1px 1px 0 grey; margin: 5% 0;}
#loginBtns {width: 100%}
#loginBtns button{width: 35%; display: inline-black; margin: 5%}
</style>
<body>

	<div class="loginContainer">
		<h1 id="loginTitle">Login</h1>	
		<form:form
			action="${pageContext.request.contextPath}/member/memberLogin.do"
			method="POST">
			<div class="loginbody">
				<c:if test="${param.error ne null}">
					<div class="alert alert-danger" role="alert">아이디 또는 비밀번호가
						일치하지 않습니다.</div>
				</c:if>
				<input type="text" class="form-control" name="memberId"
					placeholder="아이디" value="honggd" required> <br /> <input
					type="password" class="form-control" name="memberPwd"
					placeholder="비밀번호" value="1234" required>
			</div>

			<div class="d-flex flex-column"
				style="align-items: unset;">
				<div>
					<a href="${pageContext.request.contextPath}/oauth/kakao/login.do">
					<img id="kakao" alt="kakao" src="${pageContext.request.contextPath}/resources/images/kakaowide.png"></a>
				</div>
				<div class="d-flex justify-content-between">
					
					<div id="loginBtns">
					<input type="checkbox" class="form-check-input" name="remember-me"
							id="remember-me" /> <label for="remember-me"
							class="form-check-label">Remember me</label></br></br>
						<button type="button" class="btn btn-outline-primary btn-lg"  onclick="window.location.href='${pageContext.request.contextPath}/member/memberCreate.do'">회원가입</button>
						<button type="submit" class="btn btn-outline-primary btn-lg">로그인</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
	</div>
	<!-- Modal 끝-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>