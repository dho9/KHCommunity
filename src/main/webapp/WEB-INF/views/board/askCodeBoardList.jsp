<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.62.0/codemirror.min.css">
<style>
.anonymous{
	float: right;
	background-color: white;
	margin-right: 13px;
}
.anonymousImg{
	width: 59px;
}
</style>
	<div id="container" class="community" style="margin-top: 25px;">
	<div class="wrap title">
		<h1>
			<a>코드질문</a>
			<i class="bi bi-star" data-value="${askCodeBoardList[0].boardId}"></i>
		</h1>
	</div>
	<div class="wrap articles">
		<button type="button" class="article" id="writeArticleButton" onclick="showInputForm()">
			새 글을 작성해주세요!
			<span class="material-symbols-outlined" style="float: right;">edit</span>
		</button>
		
		<c:if test="${empty askCodeBoardList}">
			<article class="dialog">
				조회된 게시글이 존재하지 않습니다.
			</article>
		</c:if>
		<c:if test="${not empty askCodeBoardList}">
			<article>
				<c:forEach items="${askCodeBoardList}" var="board">
					<a class="article" href="${pageContext.request.contextPath}/board/boardDetail.do?id=${board.postId}">
				  		<img class="picture medium" src="${pageContext.request.contextPath}/resources/images/usericon.png"/>
				  		<c:if test="${board.anonymousCheck eq '1'}">
					  		<h3 class="medium">익명</h3>
				  		</c:if>
				  		<c:if test="${board.anonymousCheck ne '1'}">
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
	      	style="height: 63%;"
      		enctype="multipart/form-data">
	      	<input type = "hidden" name="boardId" id="boardId" value="5">
	      	<input type = "hidden" name="anonymousCheck" id="anonymousCheck" value="false">
	      	<input type = "hidden" name="text" id="text" value="">
	      	<input type = "hidden" name="grade" id="grade" >
	      	<p>
	      		<input name="title" autocomplete="off" placeholder="글 제목" class="title" id="title">
	      	</p>
	      	<p>
	      		<select name="language" id="language">
					<option value="java">Java</option>	      			
					<option value="javascript">JavaScript</option>	      			
					<option value="html">Html</option>	      			
					<option value="sql">Sql</option>	      			
	      		</select>
	      	</p>
	        <p>
	        	<textarea id="batch_content" name="batch_content"></textarea>
	        </p>
	        <div>
	        	<label for="hashTag">해시태그</label><br>
	        	<input type="text" class="hashTag" placeholder="Enter로 해시태그를 등록해주세요"/>
	        	<div class="hashTag-container"></div>
	        </div>
	        <input class="file" type="file" name="file" multiple="multiple" style="margin-top: 2%;">
	        <button type="button" class="cancel" onclick="hideInputForm()" style="float: right;border-left: solid 3px white;">취소</button>
        	<button type="submit" id="submitBtn" style="float: right;" ><span class="material-symbols-outlined" >edit</span></button>
        	<button type="button" class="anonymous">
        		<img class="anonymousImg" src="${pageContext.request.contextPath}/resources/images/anonymous.png">
        	</button>
	      </form:form>
	    `;
	    
	   
	    articlesContainer.insertAdjacentHTML("afterbegin", formHtml);
	    const createForm = document.getElementById("createForm");
	    const titleInput = document.getElementById("title");

	    writeButton.style.display = "none";
	    createForm.classList.remove("hidden");
	    
	    // 에디터 설정 
	    var textarea = document.querySelector('#batch_content');
	    var language = document.querySelector('#language');
	    
	    var editor = CodeMirror.fromTextArea(textarea, {
	        lineNumbers: true,  //왼쪽 라인넘버 표기
	        lineWrapping: true, //줄바꿈. 음.. break-word;
	        mode: 'text/x-java', //모드는 java 모드
	        theme: "dracula",   //테마는 맘에드는 걸로.
	        val: textarea.value
	        
	    });
	    
	    language.addEventListener('change', (e) => {
	        var lang = e.target.value;
	        if(lang === "javascript" || lang === "html"){
	        	editor.setOption('mode', `text/\${lang}`);
	        }else {
	        	editor.setOption('mode', `text/x-\${lang}`);
	        }
	    });
	    
	    
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
	    
	    const submitBtn = document.querySelector("#submitBtn");
	    const text = document.querySelector("#text");
	    
	    
	    submitBtn.addEventListener('click', (e) => {
		    var userInput = editor.getValue();
		    text.value = userInput;
	    });
	 }
	
	
	
	// 폼 숨기기
	function hideInputForm() {
	  const writeButton = document.getElementById("writeArticleButton");
	  const createForm = document.getElementById("createForm");
	
	  writeButton.style.display = "block";
	  createForm.remove();
	}
	
	
	
	  
	  
    // load됐을때 내가 즐겨찾기한 게시판인지 확인
    window.onload = () => {
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
    	
    	// load됐을때 공감(좋아요) 했는지 확인
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