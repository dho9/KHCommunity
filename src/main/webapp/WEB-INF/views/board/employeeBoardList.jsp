<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
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
			<a>직원게시판</a>
			<i class="bi bi-star" data-value="${employeeBoardList[0].boardId}"></i>
		</h1>
	</div>
	<div class="wrap articles">
		<button type="button" class="article" id="writeArticleButton" onclick="showInputForm()">
			새 글을 작성해주세요!
			<span class="material-symbols-outlined" style="float: right;">edit</span>
		</button>
		<c:if test="${empty employeeBoardList}">
			<article class="dialog">
				조회된 게시글이 존재하지 않습니다.
			</article>
		</c:if>
		<c:if test="${not empty employeeBoardList}">
			<article>
				<c:forEach items="${employeeBoardList}" var="board">
					<a class="article" href="${pageContext.request.contextPath}/board/boardDetail.do?id=${board.postId}">
				  		<img class="picture medium" src="${pageContext.request.contextPath}/resources/images/usericon.png"/>
				  		<c:if test="${board.anonymousCheck eq 'y'}">
					  		<h3 class="medium">익명</h3>
				  		</c:if>
				  		<c:if test="${board.anonymousCheck ne 'y'}">
					  		<h3 class="medium">${board.memberId}</h3>
				  		</c:if>
					  	<time class="medium">
						  	<fmt:parseDate value="${board.postCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
						  	<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd HH:mm"/>
					  	</time>
					  	<hr>
					  	<h2 class="medium bold">${board.title}</h2> <br>
					  	<p class="medium">${board.content}</p> <br>
					  	<c:forEach items="${board.tag}" var="tag">
					  		<span class="tag">${tag}</span>
					  	</c:forEach>
					  	<ul class="status">
					  		<li><img class="like" data-value="${board.postId}" src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
					  		<li class="vote" style="margin-top: 5px;">${board.postLike}</li>
					  		<li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
					  		<li class="comment" style="margin-top: 5px;">${board.commentCount}</li>
					  	</ul>
					  	<hr>
					</a>
				</c:forEach>
			</article>
			<ul class="pagination justify-content-center">
	      	<c:if test="${currentPage > 1}">
			    <li class="page-item">
			        <li>
			        	<a class="page-link" href="${pageContext.request.contextPath}/board/employeeBoardList.do?page=${currentPage - 1}" aria-label="Previous">
			        		&laquo;
			        	</a>
			        </li>
			        <span aria-hidden="true">&laquo;</span>
	        </c:if>
		    <li class="page-item">
		    	<c:forEach var="pageNum" begin="1" end="${totalPages}">
		            <c:choose>
		              <c:when test="${pageNum eq currentPage}">
		                <li class="active"><a class="page-link" href="#">${pageNum}</a></li>
		              </c:when>
		              <c:otherwise>
		                <li><a class="page-link" href="${pageContext.request.contextPath}/board/employeeBoardList.do?page=${pageNum}">${pageNum}</a></li>
		              </c:otherwise>
		            </c:choose>
		        </c:forEach>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		      	  <c:if test="${currentPage < totalPages}">
		            <li><a href="${pageContext.request.contextPath}/board/employeeBoardList.do?page=${currentPage + 1}" ></a></li>
		          </c:if>
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</c:if>
	</div>
	<form:form name="tokenFrm"></form:form>
	<script>
	<%-- 글작성 폼 --%>
	function showInputForm() {
		 
	    const writeButton = document.getElementById("writeArticleButton");
	    const articlesContainer = document.querySelector(".articles");

	    const formHtml = `
	      <form:form 
	      	name="createFrm" 
	      	class="hidden" 
	      	action="${pageContext.request.contextPath}/board/createPost.do" 
	      	id="createForm" 
	      	method="post" 
	      	style="height: 66%;"
      		enctype="multipart/form-data">
	      	<input type = "hidden" name="boardId" id="boardId" value="9">
	      	<input type = "hidden" name="anonymousCheck" id="anonymousCheck" value="false">
	      	<input type = "hidden" name="grade" id="grade" >
	      	<p>
	      		<input name="title" autocomplete="off" placeholder="글 제목" class="title" id="title">
	      	</p>
	        <p>
	        	<textarea name="text" placeholder="KH소통할까?는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다. 위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다. 

	아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다. 

	※ 정치·사회 관련 행위 금지 
	- 국가기관, 정치 관련 단체, 언론, 시민단체에 대한 언급 혹은 이와 관련한 행위 
	- 정책·외교 또는 정치·정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위 
	- 성별, 종교, 인종, 출신, 지역, 직업, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위 
	- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위 
	* 해당 게시물은 시사·이슈 게시판에만 작성 가능합니다. 

	※ 홍보 및 판매 관련 행위 금지 
	- 영리 여부와 관계 없이 사업체·기관·단체·개인에게 직간접적으로 영향을 줄 수 있는 게시물 작성 행위 
	- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭·단어 언급 행위 
	* 해당 게시물은 홍보게시판에만 작성 가능합니다. 

	※ 불법촬영물 유통 금지
	불법촬영물등을 게재할 경우 전기통신사업법에 따라 삭제 조치 및 서비스 이용이 영구적으로 제한될 수 있으며 관련 법률에 따라 처벌받을 수 있습니다. 

	※ 그 밖의 규칙 위반 
	- 타인의 권리를 침해하거나 불쾌감을 주는 행위 
	- 범죄, 불법 행위 등 법령을 위반하는 행위 
	- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위 
	- 음란물, 성적 수치심을 유발하는 행위 
	- 스포일러, 공포, 속임, 놀라게 하는 행위" class="smallplaceholder" id="text"></textarea>
	        </p>
	        <div>
	        	<label for="hashTag">해시태그</label><br>
	        	<input type="text" class="hashTag" placeholder="Enter로 해시태그를 등록해주세요"/>
	        	<div class="hashTag-container"></div>
	        </div>
	        <input class="file" type="file" name="file" multiple="multiple" style="margin-top: 2%;">
	        <button type="button" class="cancel" onclick="hideInputForm()" style="float: right;border-left: solid 3px white; background-color: #0ca5af;">취소</button>
        	<button class="createPostBtn" style="float: right;" ><span class="material-symbols-outlined" >edit</span></button>
        	<button type="button" class="anonymous" onclick="anonymousCheck()">
	    		<img class="anonymousImg" src="${pageContext.request.contextPath}/resources/images/anonymous.png">
	    	</button>
	      </form:form>
	    `;

	    articlesContainer.insertAdjacentHTML("afterbegin", formHtml);
	    const createForm = document.getElementById("createForm");
	    const titleInput = document.getElementById("title");
	    const contentTextarea = document.getElementById("text");

	    writeButton.style.display = "none";
	    createForm.classList.remove("hidden");
	    
	 	// 익명체크
		let anonymousButton = document.querySelector(".anonymous");  
		let anonymousImg = document.querySelector(".anonymousImg");
		let anonymousCheck = document.querySelector("#anonymousCheck");
		
		anonymousButton.onclick = (()=>{
		    if (anonymousImg.src.endsWith('/anonymous.png')) {
		    	anonymousImg.src = '${pageContext.request.contextPath}/resources/images/anonymouscheck.png';
		    	anonymousCheck.value = "true";
		    	console.log("anonymousCheck", anonymousCheck.value);
		        
		    } else {
		    	anonymousImg.src = '${pageContext.request.contextPath}/resources/images/anonymous.png';
		    	anonymousCheck.value = "false";
		    	console.log("anonymousCheck", anonymousCheck.value);
		    }
		});
	    
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
	        console.log(tag);
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
		
	  function hideInputForm() {
	    const writeButton = document.getElementById("writeArticleButton");
	    const createForm = document.getElementById("createForm");
	
	    writeButton.style.display = "block";
	    createForm.remove();
	  }
	  
	// 익명체크
	function anonymousCheck() {
		const writeButton = document.getElementById("writeArticleButton");
		  const createForm = document.getElementById("createForm");
		
		  writeButton.style.display = "block";
		  createForm.remove();
	}
	  
	// onload 됐을때 즐겨찾기/공감 했는지
	document.addEventListener('DOMContentLoaded', () => {
		isFovorite(); // 즐겨찾기했는지
		isLike(); // 공감했는지
	});
	  
	// onload 됐을때 즐겨찾기/공감 했는지
	document.addEventListener('DOMContentLoaded', () => {
		isFovorite(); // 즐겨찾기했는지
		isLike(); // 공감했는지
	});
	  
    // 내가 즐겨찾기한 게시판인지 확인
	function isFovorite() {
    	console.log(document.querySelector('.bi').dataset.value);
    	$.ajax({
    		url : "${pageContext.request.contextPath}/board/favorite.do",
    		data : {
                _boardId : document.querySelector('.bi').dataset.value
            },
    		method : "GET",
    		dataType : "json",
    		success(responseData) {
    			const {available} = responseData;
    			
    			const star = document.querySelector('.bi');
    			if(available) {
                	star.classList.remove('bi-star');
                	star.classList.add('bi-star-fill');
                }
                else {
                	star.classList.add('bi-star');
                	star.classList.remove('bi-star-fill');
                }
    		}
    	});
	}
    
   	// 공감(좋아요) 했는지 확인
    function isLike() {
    	document.querySelectorAll('.like').forEach((e) => {
	    	console.log(e.dataset.value);
	   		$.ajax({
	   			url : "${pageContext.request.contextPath}/board/postLike.do",
	   			data : {
	   				_postId : e.dataset.value
	   			},
	   			method : "GET",
	               dataType : "json",
	               success(responseData) {
	       			const {available, likeCount} = responseData;
	       			const {postLikeCount} = likeCount;
	       			
	       			const like = document.querySelectorAll('.like');
	       			const vote = document.querySelectorAll('.vote');
	       			for(let i=0; i<like.length; i++) {
	       				if(like[i].dataset.value == e.dataset.value) {
			       			if(available) {
			                   	like[i].src = "${pageContext.request.contextPath}/resources/images/fullLike.png";
			                   	vote[i].innerHTML = `\${postLikeCount}`;
			                   }
			                   else {
			                   	like[i].src = "${pageContext.request.contextPath}/resources/images/like.png";
			                   	vote[i].innerHTML = `\${postLikeCount}`;
			                   }
	       				}
	       			}
	               }
	   		});
    	});
    }
   	
    // 즐겨찾기 누르기
    document.querySelector('.bi').onclick = (e) => {
    	console.log(e.target.dataset.value);
    	
    	const token = document.tokenFrm._csrf.value;
    	
        $.ajax({
            url : "${pageContext.request.contextPath}/board/favorite.do",
            data : {
                _boardId : e.target.dataset.value
            },
            headers: {
                "X-CSRF-TOKEN": token
            },
            method : "POST",
            dataType : "json",
            success(responseData) {
                console.log(responseData);
                const {available} = responseData;
                
                const star = document.querySelector('.bi');
                if(available) {
                	star.classList.add('bi-star');
                	star.classList.remove('bi-star-fill');
                }
                else {
                	star.classList.remove('bi-star');
                	star.classList.add('bi-star-fill');
                }
            }
        });
    };
    </script>
<%@ include file="/WEB-INF/views/common/rightSide.jsp" %>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>