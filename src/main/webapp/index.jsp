<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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

/* 여기부터 */
 
.carousel {
  position: relative;
}

.carousel.pointer-event {
  touch-action: pan-y;
}

.carousel-inner {
  position: relative;
  width: 100%;
  overflow: hidden;
}
.carousel-inner::after {
  display: block;
  clear: both;
  content: '';
}

.carousel-item {
  position: relative;
  display: none;
  float: left;
  width: 100%;
  margin-right: -100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  transition: transform 0.6s ease-in-out;
}
@media (prefers-reduced-motion: reduce) {
  .carousel-item {
    transition: none;
  }
}

.carousel-item.active,
.carousel-item-next,
.carousel-item-prev {
  display: block;
}

.carousel-item-next:not(.carousel-item-start),
.active.carousel-item-end {
  transform: translateX(100%);
}

.carousel-item-prev:not(.carousel-item-end),
.active.carousel-item-start {
  transform: translateX(-100%);
}

.carousel-fade .carousel-item {
  opacity: 0;
  transition-property: opacity;
  transform: none;
}
.carousel-fade .carousel-item.active,
.carousel-fade .carousel-item-next.carousel-item-start,
.carousel-fade .carousel-item-prev.carousel-item-end {
  z-index: 1;
  opacity: 1;
}
.carousel-fade .active.carousel-item-start,
.carousel-fade .active.carousel-item-end {
  z-index: 0;
  opacity: 0;
  transition: opacity 0s 0.6s;
}
@media (prefers-reduced-motion: reduce) {
  .carousel-fade .active.carousel-item-start,
  .carousel-fade .active.carousel-item-end {
    transition: none;
  }
}

.carousel-control-prev,
.carousel-control-next {
  position: absolute;
  top: 0;
  bottom: 0;
  z-index: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 15%;
  padding: 0;
  color: #fff;
  text-align: center;
  background: none;
  border: 0;
  opacity: 0.5;
  transition: opacity 0.15s ease;
}
@media (prefers-reduced-motion: reduce) {
  .carousel-control-prev,
  .carousel-control-next {
    transition: none;
  }
}
.carousel-control-prev:hover,
.carousel-control-prev:focus,
.carousel-control-next:hover,
.carousel-control-next:focus {
  color: #fff;
  text-decoration: none;
  outline: 0;
  opacity: 0.9;
}

.carousel-control-prev {
  left: 0;
}

.carousel-control-next {
  right: 0;
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
  display: inline-block;
  width: 2rem;
  height: 2rem;
  background-repeat: no-repeat;
  background-position: 50%;
  background-size: 100% 100%;
}

/* rtl:options: {
  "autoRename": true,
  "stringMap":[ {
    "name"    : "prev-next",
    "search"  : "prev",
    "replace" : "next"
  } ]
} */
.carousel-control-prev-icon {
  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3e%3cpath d='M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z'/%3e%3c/svg%3e");
}

.carousel-control-next-icon {
  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3e%3cpath d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

.carousel-indicators {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 2;
  display: flex;
  justify-content: center;
  padding: 0;
  margin-right: 15%;
  margin-bottom: 1rem;
  margin-left: 15%;
  list-style: none;
}
.carousel-indicators [data-bs-target] {
  box-sizing: content-box;
  flex: 0 1 auto;
  width: 30px;
  height: 3px;
  padding: 0;
  margin-right: 3px;
  margin-left: 3px;
  text-indent: -999px;
  cursor: pointer;
  background-color: #fff;
  background-clip: padding-box;
  border: 0;
  border-top: 10px solid transparent;
  border-bottom: 10px solid transparent;
  opacity: 0.5;
  transition: opacity 0.6s ease;
}
@media (prefers-reduced-motion: reduce) {
  .carousel-indicators [data-bs-target] {
    transition: none;
  }
}
.carousel-indicators .active {
  opacity: 1;
}

.carousel-caption {
  position: absolute;
  right: 15%;
  bottom: 1.25rem;
  left: 15%;
  padding-top: 1.25rem;
  padding-bottom: 1.25rem;
  color: #fff;
  text-align: center;
}

.carousel-dark .carousel-control-prev-icon,
.carousel-dark .carousel-control-next-icon {
  filter: invert(1) grayscale(100);
}
.carousel-dark .carousel-indicators [data-bs-target] {
  background-color: #000;
}
.carousel-dark .carousel-caption {
  color: #000;
}
.visually-hidden,
.visually-hidden-focusable:not(:focus):not(:focus-within) {
  position: absolute !important;
  width: 1px !important;
  height: 1px !important;
  padding: 0 !important;
  margin: -1px !important;
  overflow: hidden !important;
  clip: rect(0, 0, 0, 0) !important;
  white-space: nowrap !important;
  border: 0 !important;
}
.d-block {
  display: block !important;
}

.carousel-control-prev,
.carousel-control-next {
  position: absolute;
  top: 0;
  bottom: 0;
  z-index: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 15%;
  padding: 0;
  color: #fff;
  text-align: center;
  background: none;
  border: 0;
  opacity: 0.5;
  transition: opacity 0.15s ease;
}
@media (prefers-reduced-motion: reduce) {
  .carousel-control-prev,
  .carousel-control-next {
    transition: none;
  }
}
.carousel-control-prev:hover,
.carousel-control-prev:focus,
.carousel-control-next:hover,
.carousel-control-next:focus {
  color: #fff;
  text-decoration: none;
  outline: 0;
  opacity: 0.9;
}

.carousel-control-prev {
  left: 0;
}

.carousel-control-next {
  right: 0;
} 
/* 
/* 여기 2*/
   .slider-container {
    width: 600px;
    height: 231px;
    overflow: hidden;
    position: relative;
  }

  .slider-wrapper {
    display: flex;
    width: 300%;
    animation: slideAnimation 9s infinite;
  }

  .slider-item {
    flex: 1;
    width: 600px;
    height: 216px;
  }

  @keyframes slideAnimation {
    0%, 100% {
      transform: translateX(0);
    }
    16.66%, 100.33% {
      transform: translateX(-600px);
    }
    33.33%, 200.66% {
      transform: translateX(-1200px);
    }
  
  } */

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

<%--   	 		  <div id="carouselExample" class="carousel slide carousel-fade" data-interval="3000">
			    <div class="carousel-inner">
			      <div class="carousel-item active" data-interval="3000">
			        <a href="${pageContext.request.contextPath}/store/storeList.do">
			          <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/banner1-1.png">
			        </a>
			      </div>
			      <div class="carousel-item">
			        <a href="https://www.iei.or.kr/company/company.kh">
			          <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/banner1.png">
			        </a>
			      </div>
			      <div class="carousel-item">
			        <a href="${pageContext.request.contextPath}/board/todayFoodBoardList.do">
			          <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/banner3.png">
			        </a>
			      </div>
			    </div>
			    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" aria-label="Previous">
			      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    </button>
			    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" aria-label="Next">
			      <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    </button>
			  </div>    --%>
			  
			  
			  <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				        <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/banner1-1.png">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/banner1.png">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/banner3.png">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
        	<!-- 여기까지  -->
        
        
<%--             <a href="https://www.iei.or.kr/company/company.kh"><img src="${pageContext.request.contextPath}/resources/images/banner3.png"
                    style="width: 600px; height: 216px;"></a> --%>
         </div> 
        <sec:authentication property="principal" var="loginMember"/>
        <form:form name ="memberLogoutFrm" 
        	action="${pageContext.request.contextPath}/member/memberLogout.do" 
        	method="POST">
		</form:form>
        <div class="leftside">
            <div class="card pconly" style="margin-bottom: 19px;">
                <form class="logged">
                    <sec:authorize access="isAuthenticated()">
                   		<img src="https://cf-fpi.everytime.kr/0.png" class="picture">
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
	                        <li><a href="#" id="logoutLink" onclick="logoutFn();">로그아웃</a></li>    
	                    </sec:authorize>  
	                    <sec:authorize access="isAnonymous()">
	                    	<p style="font-size: 14px; margin-left: 7px; margin-bottom: 27px; color: #737373;">커뮤니티 이용을 위해 <span style="color:royalblue; font-weight: bold;">로그인</span>이 필요합니다!</p>
	                    	<li style="margin: 0 8.5%; width: 125px;" ><a class="anonymousBtn" href="${pageContext.request.contextPath}/member/memberLogin.do">로그인</a></li>
	                    	<br/><br/>
	                    	<li style="margin: 0 8.5%; width: 125px;"><a  class="anonymousBtn" href="${pageContext.request.contextPath}/member/memberCreate.do">회원가입</a></li>
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
                     <%--    <li><a href="${pageContext.request.contextPath}/board/study.do">sdasdsadas</a></li> --%>
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
        </div></div>
        
<script>
   $(document).ready(function() {
       $('#carouselExample').carousel();
   });
   
   document.addEventListener('DOMContentLoaded', function() {

	    const carouselItems = document.querySelectorAll('.carousel-item');
	    
	    carouselItems[0].addEventListener('click', () => {
	    	  window.location.href = 'https://www.iei.or.kr/company/company.kh';
	    });
	    carouselItems[1].addEventListener('click', () => {
	    	  window.location.href = '{pageContext.request.contextPath}/board/todayFoodBoardList.do';
	    });
	    carouselItems[2].addEventListener('click', () => {
	    	  window.location.href = '${pageContext.request.contextPath}/store/storeList.do';
	    });
   });

   
</script>
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

const logoutFn =()=>{
	memberLogoutFrm.submit();
	
};

</script>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>