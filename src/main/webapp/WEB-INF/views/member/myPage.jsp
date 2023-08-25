<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
	<!-- bootstrap css -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
@font-face {
    font-family: 'HakgyoansimWoojuR';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.myPageIcon {width:34%; display:inline-block; padding:10px 0 0 0; font-family: 'HakgyoansimWoojuR'; font-size: 60px; text-align: center; margin: 5%;}
.myPageIcon p {font-family: 'HakgyoansimWoojuR'; font-size: 30px; margin: 7% 0;}
.myPageIcon:hover {border-radius: 10px; background-color: #e3f5fc; cursor: pointer;}
.container-md{display:table-cell; margin-top:2%; border-radius: 30px;}
section {width: 1200px; text-align: center; margin: 2% auto;}
#memberInfo{width: 80%;  height:200px; text-align: left; background-color: #4870ef; display:inline-block; border-radius: 30px; margin-bottom: 60px;}
#memberInfo h2{ font-family: 'HakgyoansimWoojuR'; font-size: 63px; color:white; margin:3%;}
#memberInfo p{ font-family: 'HakgyoansimWoojuR'; font-size: 30px; color:white; margin:2%;}
#memberInfo div{display:inline-block;}
#info-container {width:67%;} 
#dDay {width:30%; height:100%; vertical-align: middle; text-align: center;}
#memberInfo h1{ font-family: 'HakgyoansimWoojuR'; font-size: 80px; color:white;}
.container{display: initial; }


/* 정보수정 폼 */
#update-container {display: flex; justify-content: center; align-items: center; min-height: 57vh; font-family: 'HakgyoansimWoojuR'; }
#delete-container form {font-family: 'HakgyoansimWoojuR'; width: 500px; padding: 78px; background-color: #fff; border-radius: 8px; text-align: left;}
#update-container form {width: 500px; background-color: #fff; border-radius: 8px; text-align: left;}
form tr {margin-bottom: 16px;}
form th {padding-right: 16px;}
input[type="text"], input[type="password"], input[type="date"], input[type="tel"], input[type="email"] {font-size: 16px;padding: 8px; border: 1px solid #ccc; border-radius: 4px; width: 100%;}
input[type="submit"], input[type="reset"] {font-size: 16px;padding: 8px 16px; margin-top: 16px; border: none; border-radius: 4px; background-color: #28a745; color: #fff; cursor: pointer;}
input[type="submit"]:hover, input[type="reset"]:hover { background-color: #218838;}
div#update-container{width: 483px; margin:0 auto; text-align:center;}
div#update-container input, div#update-container select {margin-bottom:10px;}

/*  추가된 css */
#certificationDiv{display:none;} 
#vacationDiv{display:none;} 
#delete-container{display:none;}
#certificationDiv label{ font-size: 50px; color: blue; width:90%}
#certificationDiv h1{font-family: 'HakgyoansimWoojuR'; font-size: 50px; font-weight:bold;}
#certificaitonFrm{width: 90%; font-family: 'HakgyoansimWoojuR'; font-size: 22px; margin:5%;}
#certificaitonFrm div input{font-family: 'HakgyoansimWoojuR'; font-size: 22px; width:68%; display: inline-block;}
.frmStyles{font-family: 'HakgyoansimWoojuR'; font-size: 22px; width:45%; display: inline-block;}
#certificaitonFrm label{font-family: 'HakgyoansimWoojuR'; font-size: 22px; width:18%; display: inline-block;}
#certificaitonFrm div{margin: 5% 0; padding: 3%}
.certiBtn {border-radius: 10px; border: 2px solid #4870ef; background-color: white; color: #4870ef; width:100px; height:40px;}
.fileInput{border: 1px solid black; border-radius: 5px; width: 500px}
.certiBtn:hover{background-color: #4870ef; color: white;} 
/*  추가된 css */

.myPageDivs{width: 90%}

/* 내정보 css시작 */
#myInfo-container h1{font-family: 'HakgyoansimWoojuR'; font-size: 57px; font-weight:bold; padding:65px;}
#myInfo-container p {font-size: 20px; } 
/* 내정보 css끝 */

/*식권구매 css시작*/
#ticketInfo-container {text-align: center; }
#ticketInfo-container h1{padding-left: 95px; font-family: 'HakgyoansimWoojuR'; font-size: 57px; font-weight:bold; padding:65px;}
#ticketInfo-container table {display: table; margin: auto; font-family: 'HakgyoansimWoojuR'; border-collapse: collapse; width: 111%; margin-bottom: 30px;}
#ticketInfo-container th, td {border: 1px solid #e3f5fc; text-align: left; padding: 8px;}
#ticketInfo-container th {background-color: #e3f5fc;}
#ticketInfo-container tr:nth-child(even) {background-color: #e3f5fc;}
#ticketInfo-container tbody .text-center {text-align: center;}
/*식권구매 css끝*/

#messageBoxDiv{ display: none;}

.truncate-text {
    max-width: 80px; /* 원하는 최대 너비 설정 */
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    cursor: pointer; /* 마우스 커서를 포인터로 변경하여 클릭 가능한 것을 나타냄 */
    display: inline-block;
}
#messageDetail {
    background-color: rgba(0, 0, 0, 0.2); /* 투명한 회색 배경 색상 설정 */
}
.modal-dialog{
	margin: 10% auto;
	width: 40%;
}

.modal-message-content{
	width: 100%;
	height: 200px;
}
</style>
	<section>
	<div id="memberInfo">
	
		<sec:authentication property="principal" var="loginMember"/>
		<div id="info-container">
			<h2><i class="bi bi-bookmark-heart-fill"></i>&nbsp;${loginMember.name}</h2>
			<a style="color:white;" href="${pageContext.request.contextPath}/admin/adminConsultingRequest.do">상담요청</a>
			<p>${studentInfo.curriculumName }반 </p>
			<p>${studentInfo.memberName} 강사님 Class ${studentInfo.classId}</p>
			<a href="${pageContext.request.contextPath}/message/messageSend.do" style="text-decoration: none;">테스트용</a>
		</div>
		<div id= "dDay">
			<h1>D - ${Ddays}</h1>
		</div>
	</div>
	
	<br/>
	<div class="container">

	<div class="container-md" style="border: 5px solid #c5d6dc; width: 470px; height:515px; font-size:50px">
		<div id="icons" class="container-fluid">
		<div class="myPageIcon" id="myPageIcon1">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  				<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  				<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
			<p>내 정보</p>
		</div>	
		<div class="myPageIcon" id="certification">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-fill-check" viewBox="0 0 16 16">
  				<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm1.679-4.493-1.335 2.226a.75.75 0 0 1-1.174.144l-.774-.773a.5.5 0 0 1 .708-.708l.547.548 1.17-1.951a.5.5 0 1 1 .858.514ZM11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
  				<path d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"/>
			</svg>
			<p>학생인증</p>
		</div>	
		
		<div class="myPageIcon" id="myPageIcon3">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
 				<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
			</svg>
			<p>정보수정</p>
		</div>	
		
		<div class="myPageIcon"  id="myPageIcon4">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
  				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  				<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
			</svg>
			<p>회원탈퇴</p>
		</div>	
		<div class="myPageIcon" id="myPageIcon5">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-airplane" viewBox="0 0 16 16">
  				<path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z"/>
			</svg>
			<p>휴가신청</p>
		</div>	
		<div class="myPageIcon" id="messageBoxList">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
  				<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
			</svg>
			<p>쪽지함</p>
		</div>	
		
		<div class="myPageIcon" id="myPageIcon7">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
 				<path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/>
			</svg>
			<p>구매내역</p>
		</div>	

		<div class="myPageIcon">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-headset" viewBox="0 0 16 16">
				<path d="M8 1a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a6 6 0 1 1 12 0v6a2.5 2.5 0 0 1-2.5 2.5H9.366a1 1 0 0 1-.866.5h-1a1 1 0 1 1 0-2h1a1 1 0 0 1 .866.5H11.5A1.5 1.5 0 0 0 13 12h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h1V6a5 5 0 0 0-5-5z"/>
			</svg>
			<p>상담내역</p>
		</div>

		</div>
		</div>	
		<div class="container-md" style="width:655px; height:500px; border: 1px solid black;" >
		<!--희진 내정보 시작  -->
		<div id="myInfo-container" class="myPageDivs"  name="myInfo">
			<h1> 내 정보 </h1>
			<p>${studentInfo.curriculumName }반</p>
			<p>${studentInfo.memberName} 강사님 Class ${studentInfo.classId}</p>
			<p>이름   : ${loginMember.name}</p>
			<p>아이디  : ${loginMember.username}</p>
			<p>생일   : ${ loginMember.birthday}</p>
			<p>전화번호 : ${ loginMember.memberPhone}</p>
			<p>이메일  : ${ loginMember.memberEmail}</p>
			<p>종강일  : ${studentInfo.curriculumEndAt }</p>
			
			<%-- <p>Dday  :${Ddays}</p> --%>
			
		</div> 
		<!--희진 내정보 끝 -->
		
		<!--희진 회원정보수정(비밀번호, 생일, 전화번호) 시작  -->
			<div id="update-container" class="myPageDivs" style= "display:none;">
				<%-- principal을 변수 loginMember 저장 --%>
				<form:form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post" id="memberUpdateFrm">
					<tr>
						<th>아이디 : </th>
						<td>
							<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="memberId" id="memberId" value='${loginMember.username}' readonly required/>
						</td>
					</tr>
					
					<br/>
					
					<tr>
						<th>패스워드 : </th>
						<td>
							<input type="password" class="form-control" name="memberPwd" placeholder="비밀번호" id="memberPwd" value='<sec:authentication property="principal.memberPwd"/>' required>
						</td>
					</tr>
					
					<br/>
					
					<tr>
						<th>패스워드 확인 : </th>
						<td>
							<input type="password" class="form-control" id="passwordConfirmation" value='<sec:authentication property="principal.memberPwd"/>' required>
						</td>
					</tr>
					
					<br/>
					
					<tr>
						<th>이름 : </th>
						<td>
							<input type="text" class="form-control" placeholder="이름" name="name" id="name" value='${loginMember.name}' readonly required/>
						</td>
					</tr>
					
					<br/>
					
					<tr>
						<th>생일 : </th>
						<td>
							<input type="date" class="form-control" placeholder="생일" name="birthday" id="birthday" value='<sec:authentication property="principal.birthday"/>'/>
						</td>
					</tr>
					<br/>
					
					<tr>
						<th>전화번호 : </th>
						<td>
							<input type="tel" class="form-control" placeholder="010-1234-5678" name=memberPhone id="phone" maxlength="13" value='<sec:authentication property="principal.memberPhone"/>' required>
						</td>
					</tr>
					<br/>
					
					<tr>
						<th>이메일 : </th>
						<td>
							<input type="email" class="form-control" placeholder="이메일" name="memberEmail" id="email" value='<sec:authentication property="principal.memberEmail"/>'readonly required/>
						</td>
					</tr>
					<br/>
					<input type="submit" class="btn btn-outline-success" value="수정" >&nbsp;
					<input type="reset" class="btn btn-outline-success" value="초기화">
				</form:form>
			</div>
			<!--희진 회원정보수정 끝  -->
			
			<!--희진 회원탈퇴 시작  -->
				<div id="delete-container" class="myPageDivs">
					<%-- principal을 변수 loginMember 저장 --%>					
					<form:form name="memberDeleteFrm" action="${pageContext.request.contextPath}/member/memberDelete.do" id="memberDeleteFrm" method="post">
						<tr>
							<th>아이디 : </th>
							<td>
								<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="memberId" id="memberId" value='${loginMember.username}' readonly required/>
							</td>
						</tr>
						
						<br/>
						
						<tr>
							<th>패스워드 : </th>
							<td>
								<input type="password" class="form-control" name="memberPwd" placeholder="비밀번호" id="memberPwd" value='<sec:authentication property="principal.memberPwd"/>' required>
							</td>
						</tr>
						
						<br/>
						
						<tr>
							<th>패스워드 확인 : </th>
							<td>
								<input type="password" class="form-control" id="passwordConfirmation" value='<sec:authentication property="principal.memberPwd"/>' required>
							</td>
						</tr>
						
						<br/>
						
						<tr>
							<th>이름 : </th>
							<td>
								<input type="text" class="form-control" placeholder="이름" name="name" id="name" value='${loginMember.name}' readonly required/>
							</td>
						</tr>
						
						<br/>
						
						<tr>
							<th>생일 : </th>
							<td>
								<input type="date" class="form-control" placeholder="생일" name="birthday" id="birthday" value='<sec:authentication property="principal.birthday"/>'/>
							</td>
						</tr>
						<br/>
						
						<tr>
							<th>전화번호 : </th>
							<td>
								<input type="tel" class="form-control" placeholder="010-1234-5678" name=memberPhone id="phone" maxlength="13" value='<sec:authentication property="principal.memberPhone"/>' required>
							</td>
						</tr>
						<br/>
						
						<tr>
							<th>이메일 : </th>
							<td>
								<input type="email" class="form-control" placeholder="이메일" name="memberEmail" id="email" value='<sec:authentication property="principal.memberEmail"/>'readonly required/>
							</td>
						</tr>
						<br/>
						<td>
	    					
	    					<input type="button" class="btn btn-outline-success" value="탈퇴하기" onclick="console.log('버튼 클릭 확인'); deleteMember();" />
	    				</td>
					</form:form>
				</div>
			<!-- 희진 회원탈퇴 끝 -->
			
			<!-- 희진 식권구매 시작 -->
			<div id="ticketInfo-container" class="myPageDivs" style ="display:none;">
				<h1>
					<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
	 					<path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/>
					</svg>
					식권구매내역
				</h1>
				<table>
					<thead>
						<th>주문번호</th>
						<th>가게이름</th>
						<th>식권매수</th>
						<th>총가격</th>
						
					</thead>
					<tbody>
					<c:if test="${empty studentTicketInfo }">
						<tr>
							<td colspan="5" class="text-center">조회된 구매식권이 없습니다.</td>
						</tr>
					</c:if>
					 <c:if test="${not empty studentTicketInfo}">
						<c:forEach items="${studentTicketInfo}" var="studentTicketInfo" varStatus="vs">
							<tr>
								<td>${studentTicketInfo.orderId}</td>
								<td>${studentTicketInfo.storename}</td>
								<td>${studentTicketInfo.amount}</td>
								<td>${studentTicketInfo.totalPrice}</td>
							</tr>
						</c:forEach>
					 </c:if>
					</tbody>
				</table>
			</div>
			<!-- 희진 식권구매 끝 -->
			<!-- 채팅목록 시작 -->
			<!-- 채팅목록 끝 -->
			
			<!-- 추가된 html -->
			<div class="myPageDivs" id="certificationDiv" >		
				<h1>학생인증</h1>
				<form:form name="certificaitonFrm" action="${pageContext.request.contextPath}/member/certification.do" 
					enctype = "multipart/form-data" method="post" id="certificaitonFrm">
					<label class="frmStyles" for="memberId">아이디 &nbsp;: &nbsp;</label>
					<input type="text" class="frmStyles" name="memberId" id="memberId" value="${loginMember.username}" readonly>
					</br></br>
					<label class="frmStyles" for="state">처리상황 &nbsp;: &nbsp;</label>
					<span id="state" class="frmStyles"></span>
					<div class="input-group" style="padding:0px;">
		  				<div class="custom-file">
		    				<input type="file" class="fileInput" name="upFile" id="upFile" multiple>
		    				<!-- <label class="custom-file-label" for="upFile">파일을 선택하세요</label> -->
		  				</div>		  				
					</div>
					<br/>
					<input type="submit" class="certiBtn" value="저장" >
				</form:form>
			</div>
			
			
			
	<div class="myPageDivs" id="messageBoxDiv" >	
			
				<table class="table table-hover">
					<thead>
						<th>No</th>
						<th>보낸사람</th>
						<th>내용</th>
						<th>받은날짜</th>
						<th>읽음여부</th>
					</thead>
					<tbody id= "messageBoxTbl">
					<%-- <c:if test="${empty messageList}">
						<tr>
							<td colspan="5" class="text-center">받은 쪽지가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty messageList}">
						<c:forEach items="${messageList}" var="message" varStatus="vs">
							<tr>
								<td>${message.messageId}</td>
								<td>${message.sendId}</td>
								<td>${message.messageContent}</td>
								<td>${message.sendAt}</td>
								<td>${message.readCheck}</td>
							</tr>
						</c:forEach>
					 </c:if> --%>
					</tbody>
				</table>
			</div>
			<!-- 추가된 html -->
			
			<!-- 휴가신청 시작  -->
			<div class="myPageDivs" id="vacationDiv" >		
				<h1>휴가신청</h1>
				<form:form name="vacationSubmitFrm" action="${pageContext.request.contextPath}/member/vacationSubmit.do" 
					enctype = "multipart/form-data" method="post" id="vacationSubmitFrm">
				
					<label class="frmStyles" for="memberId">아이디 &nbsp;: &nbsp;</label>
					<input type="text" class="frmStyles" name="memberId" id="memberId" value="${loginMember.username}" readonly>
						<tr>
							<th>휴가시작날짜 : </th>
							<td>
								<input type="date" class="form-control" placeholder="휴가시작날짜" name="vacationStartDate" id="vacationStartDate"/>
							</td>
						</tr>
						<br/>
						<tr>
							<th>휴가끝나는날짜 : </th>
							<td>
								<input type="date" class="form-control" placeholder="휴가끝날짜" name="vacationEndDate" id="vacationEndDate" />
							</td>
						</tr>
						
						<br/>
						<label class="frmStyles" for="teacherId">담당강사님 &nbsp;: &nbsp;</label>
					<input type="text" class="frmStyles" name="teacherId" id="memberId" value="${studentInfo.teacherId} " readonly>
					
					<div class="input-group" style="padding:0px;">
		  				<div class="custom-file">
		    				<input type="file" class="fileInput" name="upFile" id="upFile" multiple>
		    				<!-- <label class="custom-file-label" for="upFile">파일을 선택하세요</label> -->
		  				</div>		  				
					</div>
					<label class="frmStyles" for="state">처리상황 &nbsp;: &nbsp;</label>
					<span id="state" class="frmStyles"></span>
					<br/>
					<input type="submit" class="VacationBtn" value="저장" >
				</form:form>
			</div>
			<!-- 휴가신청 끝  -->
			
			</div>
			
			</div>
<div id="messageDetail" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal">&times;</button></br>
                <h3>쪽지내용 상세보기</h3></br></br>
                <textarea class="modal-message-content"></textarea></br></br>
                 <button type="button" class="btn btn-primary" id="editButton">삭제</button>&nbsp;&nbsp;&nbsp;
                 <button type="button" class="btn btn-outline-primary" id="reportButton">신고</button>
            </div>
        </div>
    </div>
</div>		
	</section>

	<script>
		
		const hideDiv =() =>{
			const myPageDivs = document.querySelectorAll(".myPageDivs");
			
			for(let i = 0; i < myPageDivs.length ; i++){
				myPageDivs[i].style.display = "none";
			}
			
		};
		
		document.memberUpdateFrm.onsubmit = (e) => {
		
			const password = document.querySelector("#memberPwd");
			const passwordConfirmation = document.querySelector("#passwordConfirmation");
			
			if(password.value !== passwordConfirmation.value) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}else{
				alert("회원정보가 정상적으로 수정되었습니다.");
			}
			
		};
		
		const deleteMember = () => {
			  const result = confirm('정말 탈퇴하시겠습니까?');
			 
			  if (result === true) {
			    document.memberDeleteFrm.submit();
			  }
			};
		
		const myPageIcon1 = document.querySelector("#myPageIcon1"); // 내정보 아이콘
		const myPageIcon3 = document.querySelector("#myPageIcon3"); // 회원정보 수정 아이콘
		const myPageIcon4 = document.querySelector("#myPageIcon4"); // 회원탈퇴 아이콘
		const myPageIcon7 = document.querySelector("#myPageIcon7"); // 식권구매 아이콘
		
		/* const myInfoCntainer = document.querySelector("#myInfo-container"); // 내정보
		const memberUpdateFrm = document.querySelector("#memberUpdateFrm"); // 회원정보 수정 폼
		const memberDeleteFrm = document.querySelector("#memberDeleteFrm"); // 회원탈퇴 폼
		const ticketInfo = document.querySelector("#memberDeleteFrm"); // 회원탈퇴 폼
 */		
		
		myPageIcon1.addEventListener("click", function() {
			 hideDiv();
			  document.querySelector("#myInfo-container").style.display = "block";
			});

		
		myPageIcon3.addEventListener("click", function() {
		  hideDiv();
		  document.querySelector("#update-container").style.display = "block";
		});

		myPageIcon4.addEventListener("click", function() {
			hideDiv();
			document.querySelector("#delete-container").style.display = "block"; 
		});
		
		myPageIcon7.addEventListener("click", function() {
			hideDiv();
			document.querySelector("#ticketInfo-container").style.display = "block"; 
		});
		
		
		
		document.memberDeleteFrm.onsubmit = (e) => {
			alert("정말탈퇴하시겠습니까?")
			
		};
	

document.querySelector("#certification").onclick=()=>{
	hideDiv();
	document.querySelector("#certificationDiv").style.display = "block"; 
	const value = document.querySelector("#memberId").value;
	$.ajax({
		
		url: "${pageContext.request.contextPath}/member/certificate.do",
		data :{
			memberId :value
		},
		method : "GET",
		dataType : "json",
		success(responseData){
			const {student} = responseData;
			const {approveCompleteDate, approveRequestDate} = student;
			const state = document.querySelector("#state");
			const upFile = document.querySelector("#upFile");
			if(approveCompleteDate ==null && approveRequestDate==null){
				state.value ="인증요청 없음";
				state.innerHTML=state.value;				
			}
			if(approveCompleteDate ==null && approveRequestDate!=null){
				state.value ="인증요청 처리중";
				state.innerHTML=state.value;
				$('#upFile').attr('disabled',true);
			}
			if(approveCompleteDate !=null && approveRequestDate !=null){
				state.value ="인증완료";
				state.innerHTML=state.value;
				$('#upFile').attr('disabled',true);
			}
		}
		
	});
};

messageBoxList.addEventListener("click", function() {
	hideDiv();
	document.querySelector("#messageBoxDiv").style.display = "block"; 
	
	$.ajax({
		url: "${pageContext.request.contextPath}/message/messageList.do",
		method : "GET",
		dataType : "json",
		success(responseData){
			const messageBoxTbl = document.querySelector("#messageBoxTbl");
			console.log(responseData);
			if(responseData.length > 0){
				
				msgList(responseData);	
				const title = document.querySelectorAll(".truncate-text");
				let msgId = "";
				let readCheckValue ="";
				$(document).ready(function() {
				    $(".truncate-text").click(function() {
				        var messageContent = $(this).text();
				        $(".modal-message-content").text(messageContent);
				        readCheckValue = $(this).closest("tr").find(".readCheckColumn").html();
				        msgId = $(this).closest("tr").find(".msgId").html();
				        $("#messageDetail").modal("show");
				        updateReadCheck(readCheckValue, msgId);
				        console.log(msgId);
				    });
				    $("#editButton").click(function() {
				        console.log("msgId", msgId);
				        deleteMsg(msgId);
				    });
				});
		
				
			} else{
				messageBoxTbl.innerHTMl += `
					<tr>
					<td colspan="5" class="text-center">받은 쪽지가 없습니다.</td>
					</tr>	
				`
			}
		}
		
	});

});

const updateReadCheck = (checked, msgId) =>{
	console.log(checked, msgId);
	if(checked == 'n'){
		$.ajax({
			url: "${pageContext.request.contextPath}/message/messageUpdate.do",
			data :{
				checked :checked,
				messageId: msgId
			},
			method : "GET",
			dataType : "json",
			success(responseData){
				console.log("메세지 수정 성공");
			}
			
		});
	}
	
};


const deleteMsg = (msgId) =>{
	
	$.ajax({
		url: "${pageContext.request.contextPath}/message/messageDelete.do",
		data :{
			messageId :msgId
		},
		method : "GET",
		dataType : "json",
		success(responseData){
			alert("메세지 삭제 성공");
		}
		
	});
};

const msgList =(responseData) =>{
	
	let html = ""; 
	
	responseData.forEach(function(message) {
		console.log(message);
        html += `
        <tr>
            <td class="msgId">\${message.messageId}</td>
            <td>\${message.sendId}</td>
            <td><span class="truncate-text">\${message.messageContent}</span></td>
            <td>\${message.sendAt}</td>
            <td class="readCheckColumn">\${message.readCheck}</td>
        </tr>
        `;
        
    });
	
	messageBoxTbl.innerHTML = html; 	
};




document.querySelector("#myPageIcon5").onclick =()=>{
	hideDiv();
	document.querySelector("#vacationDiv").style.display = "block"; 
	const value = document.querySelector("#memberId").value;
	const teacherValue = document.querySelector("#teacherId").value;
	
$.ajax({
		url: "${pageContext.request.contextPath}/member/vacationSubmit.do",
		data :{
			memberId :value,
			teacherId : teacherValue
		},
		method : "GET",
		dataType : "json",
		success(responseData){
			const {student} = responseData;
			const {approveCompleteDate, approveRequestDate} = student;
			const state = document.querySelector("#state");
			const upFile = document.querySelector("#upFile");
			if(approveCompleteDate ==null && approveRequestDate==null){
				state.value ="인증요청 없음";
				state.innerHTML=state.value;				
			}
			if(approveCompleteDate ==null && approveRequestDate!=null){
				state.value ="인증요청 처리중";
				state.innerHTML=state.value;
				$('#upFile').attr('disabled',true);
			}
			if(approveCompleteDate !=null && approveRequestDate !=null){
				state.value ="인증완료";
				state.innerHTML=state.value;
				$('#upFile').attr('disabled',true);
			}
		}
		
	});
};


</script>	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
