<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
a {
  text-decoration: none;
}
a.article{
color: black;
}
.anonymous{
	float: right;
	background-color: white;
	margin-right: 13px;
}
.anonymousImg{
	width: 59px;
}
.pagination {
    text-align: center;
    margin-top: 20px;
}

.pagination ul {
  display: inline-block;
  padding: 0;
}

.pagination ul li {
  display: inline;
  margin: 0 5px;
}

.pagination ul li.active a {
  font-weight: bold;
}
</style>
	
	<div id="container" class="community" style="margin-top: 25px;">
	<div class="wrap title">
		<h1>
			<a>스터디</a>
		</h1>
	</div>
	<div class="wrap articles">
		<button type="button" class="article" id="writeArticleButton" onclick="showInputForm()">
			스터디를 만들어봐요!
			<span class="material-symbols-outlined" style="float: right;">edit</span>
		</button>
		
		<c:if test="${empty studyBoardList}">
			<article class="dialog">
				조회된 게시글이 존재하지 않습니다.
			</article>
		</c:if>
			<c:if test="${not empty studyBoardList}">
				
			<article>
				<c:forEach items="${studyBoardList}" var="board">
   					 <c:if test="${board.studyPeople lt board.memberCount}">
					<a class="article" href="${pageContext.request.contextPath}/board/studyDetail.do?id=${board.postId}">
				  		<img class="picture medium" src="${pageContext.request.contextPath}/resources/images/usericon.png"/>
					  		<h3 class="medium">${board.memberId}</h3>
					  	<hr>
					  	<c:forEach items="${board.tag}" var="tag">
					  	<span class="tag">${tag}</span>
					  	</c:forEach>
					  	<h2 class="medium bold">스터디 이름 : ${board.studyName}</h2> <br>
					  	<p class="medium">모집인원 : ${board.studyPeople} / ${board.memberCount}</p> <br>
					  	<hr>
					</a>
					</c:if>
				</c:forEach>
			</article>
			</c:if>
	</div>
    <form:form name="tokenFrm"></form:form>
    <div class="rightside">
	<form action="${pageContext.request.contextPath}/board/boardSearch.do"
		class="search" onsubmit="return  validateSearchForm()">
		<input type="text" id="keyword" name="keyword" placeholder="원하는 스터디를 검색하세요!"
			class="text" />
	</form>
	 <div class="card">
        <div class="board" id="popularPostsContainer">
            <h3>
                <a>내가 참여한 스터디 목록</a>
            </h3>
        </div>
    </div>
    </div>
	
	<script>
	
	document.addEventListener('DOMContentLoaded', () => {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/board/myStudyList.do",
	        success: function(data) {
	            /* console.log(JSON.stringify(data)); */
	            
	            const container = $("#popularPostsContainer");
	            for (let i = 0; i < data.length; i++) {
	                const post = data[i];
	                const postHTML = `<a href="${pageContext.request.contextPath}/board/myStudy.do?id=\${post.boardId}" class="article">
	                    <p class="title"> ▶ \${post.studyName}</p>
	                    <hr>
	                </a>`;
	                container.append(postHTML);
	            }
	        }
	    });
	});
	
	
	function showInputForm() {
		 
	    const writeButton = document.getElementById("writeArticleButton");
	    const articlesContainer = document.querySelector(".articles");

	    const formHtml = `
	      <form:form 
	      	name="createFrm" 
	      	class="hidden" 
	      	action="${pageContext.request.contextPath}/board/createStudyPost.do" 
	      	id="createForm" 
	      	method="post" 
	      	style="height: 66%;"
      		enctype="multipart/form-data">
	      	<input type = "hidden" name="boardId" id="boardId" value="6">
	      	<input type = "hidden" name="anonymousCheck" id="anonymousCheck" value="false">
	      	<input type = "hidden" name="grade" id="grade" >
	      	<p>
	      		<input name="title" autocomplete="off" placeholder="스터디 제목" class="title" id="title">
	      	</p>
	        <p>
	        	<textarea name="text" placeholder="KH소통할까?는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다. 위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다. 
	
	        			
스터디 관련 내용을 작성 해주세요
ex ) 위치, 스터디내용 ...
	
	" class="smallplaceholder" id="text"></textarea>
	        </p>
	        <div>
	        	<label for="hashTag">&nbsp; 해시태그</label> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	        	<label for="hashTag" style="margin-left: 84px;">인원 수</label><br>
	        	<input type="text" class="hashTag" placeholder="Enter로 스터디 해시태그를 등록해주세요"/>
	        	
	        	<input type="number"  name="count" id="count" style="width: 150px; font-size: 15px; margin-left: 15px;" placeholder="스터디 인원"/ />
	        	<div class="hashTag-container"></div>
	        </div>
	        <button type="button" class="cancel" onclick="hideInputForm()" style="float: right;border-left: solid 3px white; background-color: #0ca5af;">취소</button>
        	<button class="createPostBtn" style="float: right;" ><span class="material-symbols-outlined" >edit</span></button>
	      </form:form>
	    `;
	    
	   
	    articlesContainer.insertAdjacentHTML("afterbegin", formHtml);
	    const createForm = document.getElementById("createForm");
	    const titleInput = document.getElementById("title");
	    const contentTextarea = document.getElementById("text");

	    writeButton.style.display = "none";
	    createForm.classList.remove("hidden");
	    
	 	// 해시태그
   		const hashTag = document.querySelector('.hashTag');
	    const hashTagContainer = document.querySelector('.hashTag-container');
	    
	    let hashTags = [];
	    
	    hashTag.addEventListener('keydown', (e) => {
	    	if(e.key === 'Enter') {
	    		e.preventDefault();
	    		const tag = hashTag.value.trim();
	    		
	    		if (tag.length > 5) {
	    			alert('다섯글자까지만 가능합니다');
	    			return; 
	    		}
	    		if(hashTags.length >= 7) {
	    			alert('해시태그는 최대 7개까지 가능합니다.');
	    			return;
	    		}
	    		addHashTag(tag);
	    		hashTag.value = "";
	    	}
	    });
	    
	    function addHashTag(tag) {
	        tag = tag.replace(/[\s]/g, '').trim();
	        /* console.log(tag); */
	        if (!hashTags.includes(tag)) {
	            const tagContainer = document.createElement("div");
	            tagContainer.className = "tag-container";

	            const tagElement = document.createElement("input");
	            tagElement.value = " #" + tag + " ";
	            tagElement.setAttribute("readonly", true);
	            tagContainer.appendChild(tagElement);

	            const removeButton = document.createElement("i");
	            removeButton.style.cursor = "pointer";
	            removeButton.innerHTML = "x";
	            removeButton.addEventListener('click', () => {
	                hashTagContainer.removeChild(tagContainer);
	                hashTags = hashTags.filter((hashTags) => hashTags !== tag);
	            });
	            tagContainer.appendChild(removeButton);

	            hashTags.push(tag);
	            hashTagContainer.appendChild(tagContainer);

	            tagElement.setAttribute("name", "_tags");
	            tagElement.setAttribute("value", "#" + tag);
	        }
	    }
	 }
	
	
	
	// 폼 숨기기
	function hideInputForm() {
	  const writeButton = document.getElementById("writeArticleButton");
	  const createForm = document.getElementById("createForm");
	
	  writeButton.style.display = "block";
	  createForm.remove();
	}
	  </script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>