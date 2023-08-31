<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
.card {
    /* 기존의 스타일 유지 */
    border-radius: 10px; /* 카드의 모서리를 둥글게 만듭니다 */
}
.accordion {
	display: none;
    padding: 10px 0 10px 37px;
    border-bottom: 1px solid #e3e3e3;
    line-height: 20px;
    box-sizing: border-box;
    color: #444444;
    font-size: 14px;
    background-repeat: no-repeat;
    background-size: 12px auto;
    background-position: 15px center;
}
.active {
	display: block;
}
#pageFrame {
    width: 51%;
    height: 27%;
    margin-left: 18%;
    margin-top: 0.5%;
}
</style>
    <div id="container" class="community" style="margin-top: 25px;">
        <aside class="none">
            <form class="search">
                <input type="search" name="keyword" class="text" placeholder="전체 게시판의 글을 검색하세요!">
                
            </form>
            <div class="title">
                <a class="hamburger"></a>
                <h1>KH 소통할까?</h1>
                <ol class="buttons">
                    <li><a id="searchArticle">글 검색</a></li>
                </ol>
            </div>
        </aside>
        <div class="banners">
            <a href="https://www.iei.or.kr/company/company.kh"><img src="${pageContext.request.contextPath}/resources/images/banner.png"
                    style="width: 600px; height: 200px;"></a>
        </div>
        <sec:authentication property="principal" var="loginMember"/>
        <form:form name ="memberLogoutFrm" 
        	action="${pageContext.request.contextPath}/member/memberLogout.do" 
        	method="POST">
		</form:form>
        <div class="leftside">
            <div class="card pconly">
                <form class="logged">
                    <img src="https://cf-fpi.everytime.kr/0.png" class="picture">
                    <sec:authorize access="isAuthenticated()">
                    <p class="nickname">${loginMember.username}</p>
                    <p class="school">${loginMember.name}</p>
                    <p class="school">${ loginMember.memberEmail}</p>
                    </sec:authorize>
                    <ul class="buttons">
  						<sec:authorize access="isAuthenticated()">
	                    	<c:if test="${fn:contains(loginMember.authorities, 'STUDENT')}">
		                 		<li><a href="${pageContext.request.contextPath}/member/myPage.do">내 정보</a></li>
		                 	</c:if>
		                 	<c:if test="${fn:contains(loginMember.authorities, 'TEACHER') || fn:contains(loginMember.authorities, 'ADMIN')}">
		                 		<li><a href="${pageContext.request.contextPath}/member/employeeMyPage.do">직원</a></li>
							</c:if>
	                        <li><a href="#" id="logoutLink">로그아웃</a></li>    
	                    </sec:authorize>  
	                    <sec:authorize access="isAnonymous()">
	                    	<li style="margin: 0 25%;"><a href="${pageContext.request.contextPath}/member/memberLogin.do">로그인</a></li>
	                    </sec:authorize>                   
                    </ul>
                    <hr>
                </form>
            </div>
            <sec:authorize access="isAuthenticated()">
            <div class="card">
                <div class="menus">
                    <a href="${pageContext.request.contextPath}/board/myarticle.do" class="myarticle">내가 쓴 글</a>
                    <a href="${pageContext.request.contextPath}/board/mycommentarticle.do" class="mycommentarticle">댓글 단 글</a>
                   
                    <a class="myBoard" id="myBoard">즐겨찾기</a>
                    <div class="favorite"></div>
                   
                    <hr>
                </div>
            </div>
             </sec:authorize>
            <div class="card">
                <div class="banner">
                    <a
                        href="https://ad.everytime.kr/adClick?adToken=FliIhtpw3f8JmbRowBfcPh0KpgmNqJcp4b7UDWOYOooQuvfBn74UvRuoOY2r7xMSamYmSKZ5rDDFYdGOZdfcuX07KqEVgbK273vbzrBAjfrpIvgLcDhistd4cGZIlHn9nY1gLid%2BAq36%2BYcisNTFyM20G75T9iJiCG0aRzH%2Fokf1Yoc1gLxBvMo4X5fS48EJvbUmecLLfYoFMIXnhcKcal3C9crHUt4N631%2FcUbtEPaatv0aQ2kTkOIchtu0HqRo"><img
                            src="https://cf-eba.everytime.kr/20230814_samsung_galaxybook_card.jpg"></a>
                </div>
            </div>
            <div class="card">
                <div class="banner">
                    <a
                        href="https://ad.everytime.kr/adClick?adToken=FliIhtpw3f8JmbRowBfcPh0KpgmNqJcp4b7UDWOYOooQuvfBn74UvRuoOY2r7xMSamYmSKZ5rDDFYdGOZdfcuX07KqEVgbK273vbzrBAjfrpIvgLcDhistd4cGZIlHn9nY1gLid%2BAq36%2BYcisNTFyM20G75T9iJiCG0aRzH%2FokfJhGi%2F5URPrbSoHi%2F3%2BZ%2BLM0WNHChFQuagk6jm%2BQ3%2FIcJNlsCmWYGdI7Z4E0Z%2FLNu8J26GAFgPwK%2BuYOyQ3flm"><img
                            src="https://cf-eba.everytime.kr/20230804_mafia42_card.png"></a>
                </div>
            </div>
            <div class="card">
                <div class="banner">
                    <a
                        href="https://ad.everytime.kr/adClick?adToken=FliIhtpw3f8JmbRowBfcPh0KpgmNqJcp4b7UDWOYOooQuvfBn74UvRuoOY2r7xMSamYmSKZ5rDDFYdGOZdfcuX07KqEVgbK273vbzrBAjfrpIvgLcDhistd4cGZIlHn9nY1gLid%2BAq36%2BYcisNTFyM20G75T9iJiCG0aRzH%2Fokfx%2BM3eup25j5%2BuQ0Py9JVf4EVOfRnTj3C2zW2usIX3EEXL5dvozjxJdGwJkOMEoWjzeqcOqqMtBaWh2%2FdSdzfQ"><img
                            src="https://cf-eba.everytime.kr/20230807_Santa_card.png"></a>
                </div>
            </div>
        </div>
		<%@ include file="/WEB-INF/views/common/rightSide.jsp" %>
        <div class="main">
            <div class="card">
                <div class="board" id="freeBoardContainer">
                    <h3>
                        <a href="${pageContext.request.contextPath}/board/freeBoardList.do">자유게시판</a>
                    </h3>
                </div>
            </div>
            <div class="card">
                <div class="board" id="preStudentBoardContainer">
                    <h3>
                        <a href="${pageContext.request.contextPath}/board/preStudentBoardList.do">예비생게시판</a>
                    </h3>
                </div>
            </div>
            <div class="card">
                <div class="board" id="graduateBoardContainer">
                    <h3>
                        <a href="${pageContext.request.contextPath}/board/graduateBoardList.do">수료생게시판</a>
                    </h3>
                </div>
            </div>
            <div class="card">
                <div class="board" id="sharingInformationBoardContainer">
                    <h3>
                        <a href="${pageContext.request.contextPath}/board/sharingInformationBoardList.do">정보게시판</a>
                    </h3>
                </div>
            </div>
            <div class="card">
                <div class="board" id="askCodeBoardContainer">
                    <h3>
                        <a href="${pageContext.request.contextPath}/board/askCodeBoardList.do">질문게시판</a>
                    </h3>
                </div>
            </div>
            <div class="card">
                <div class="board" id="todayFoodBoardContainer">
                    <h3>
                        <a href="${pageContext.request.contextPath}/board/todayFoodBoardList.do">오늘 뭐먹지?</a>
                    </h3>
                </div>
            </div>
        </div>
<script>
document.addEventListener('DOMContentLoaded', () => {
	loadThreePostByBoardId(1, "freeBoardContainer");
	loadThreePostByBoardId(3, "todayFoodBoardContainer");
	loadThreePostByBoardId(4, "sharingInformationBoardContainer");
	loadThreePostByBoardId(5, "askCodeBoardContainer");
	loadThreePostByBoardId(7, "graduateBoardContainer");
	loadThreePostByBoardId(8, "preStudentBoardContainer");
	//loadThreePostByBoardId(11, "myClassBoardContainer");
	//loadThreePostByBoardId(12, "jobSearchBoardContainer");
});

async function loadThreePostByBoardId(boardId, boardContainer) {
	const response = await fetch(`${pageContext.request.contextPath}/board/threePostByBoardId.do?boardId=`+boardId);
    const data = await response.json();
    
    const container  = $("#"+boardContainer);
    for (let i = 0; i < data.length; i++) {
        const post = data[i];
        const postCreatedAt = post.postCreatedAt;
        const date = new Date(postCreatedAt);

        const month = String(date.getMonth() + 1).padStart(2, "0");
        const day = String(date.getDate()).padStart(2, "0");
        const hours = String(date.getHours()).padStart(2, "0");
        const minutes = String(date.getMinutes()).padStart(2, "0");

        const formattedDate = `\${month}/\${day} \${hours}:\${minutes}`;
        const postHTML = `
	        <a style="display: flex;" href="${pageContext.request.contextPath}/board/boardDetail.do?id=\${post.postId}" class="article">
	            <p style="width: 60%;" class="title">\${post.title}</p>
	            <p style="width: 30%; height: 1%; margin-left: 11%;" class="small">\${formattedDate}</p>
	        </a>`;
        container.append(postHTML);
    }
}
</script>
<sec:authorize access="isAuthenticated()">
<script>

	// 즐겨찾기한 게시판
    document.querySelector('#myBoard').addEventListener('mouseover', () => {
        $.ajax({
            url: "${pageContext.request.contextPath}/board/myBoards.do",
            method: "GET",
            dataType: "json",
            success(responseData) {
                const favorite = document.querySelector(".favorite");

                let html = "";
                for (const board of responseData.boards) {
                    const {boardName, boardId, boardLink} = board;
                    html += `
                        <a class="accordion" href="${pageContext.request.contextPath}/board/\${boardLink}.do">\${boardName}</a>
                    `;
                }

                favorite.innerHTML = html;

                const accordions = document.querySelectorAll('.accordion');
                for (const accordion of accordions) {
                    accordion.classList.toggle('active');
                    favorite.style.display = "block";
                }
            }
        });
    });
    document.querySelector('.favorite').addEventListener('mouseleave', (e) => {
        console.log(e+'ㅋㅋㅋㅋ');
        const favorite = document.querySelector(".favorite");
        favorite.style.display = "none";
    });
</script>
</sec:authorize>
<script>

document.getElementById("logoutLink").addEventListener("click", function(event) {
	memberLogoutFrm.submit();
});

</script>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>