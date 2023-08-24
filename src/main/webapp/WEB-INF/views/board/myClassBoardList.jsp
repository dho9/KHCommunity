<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<style>
.myClassBoard-title, .myClassBoard-subTitle {
	text-align: center;
}
.myClassBoard-title {
	margin-top: 4%;
}
.input-group-prepend {
	cursor: pointer;
}
</style>

	<sec:authentication property="principal" var="loginMember"/>
	<div class="myClassBoard-title">
		<h2 class="title">우리반 게시판</h2>
		<p>${loginMember.name}님, 반갑습니다. 'KH소통할까?'에 오신 걸 환영합니다.</p>
	</div>
	<div class="myClassBoard-subTitle">
		<ul>
			<li>${studentInfo.curriculumName}반</li>
			<li>[${studentInfo.classId}] ${studentInfo.memberName} 강사님</li>
		</ul>
	</div>
	
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">글쓰기</button>
	
	<div>
		<button type="button" class="btn btn-outline-success" id="notice">공지사항</button>
		<button type="button" class="btn btn-outline-success" id="sharing">과제공유</button>
		<button type="button" class="btn btn-outline-success" id="free">게시판</button>
		<button type="button" class="btn btn-outline-success" id="allBtn">전체</button>
	</div>
	
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>
	    </tr>
	  </thead>
	  <tbody></tbody>
	</table>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="background-color: rgba(0, 0, 0, 0.5);">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">게시글 작성</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" style="height: 690px;">
	      	<form:form name="createFrm" class="hidden" action="${pageContext.request.contextPath}/board/createPost.do" id="createForm" method="POST" enctype="multipart/form-data" style="height: 550px;">
		      	<input type = "hidden" name="boardId" id="boardId" value="11">
		      	<div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <input style="width: 105px; height: 43px;" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="_tags" value="공지사항"/>
				    <div class="dropdown-menu">
				      <a class="dropdown-item">공지사항</a>
				      <a class="dropdown-item">과제공유</a>
				      <a class="dropdown-item">게시판</a>
				    </div>
				  </div>
				  <input type="text" name="title" class="form-control" aria-label="Text input with dropdown button" placeholder="글 제목">
				</div>
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
	- 스포일러, 공포, 속임, 놀라게 하는 행위" class="smallplaceholder" id="text" style="width: 100%; height: 91%;"></textarea>
		        </p>
		 	    <input style="margin-top: 5px;" class="file" type="file" name="file" multiple="multiple">
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" id="clearBtn">취소</button>
		        <button type="submit" class="btn btn-primary" id="saveBtn">작성</button>
		      </div>
		      </form:form>
	      </div>
	    </div>
	  </div>
	</div>
	<form:form name="tokenFrm"></form:form>
	<script>
	// onload되면 전체버튼 출력
	window.onload = () => {
		document.querySelector('#allBtn').click();
	};
	// 전체 버튼
	document.querySelector('#allBtn').addEventListener('click', () => {
		$.ajax({
			url : "${pageContext.request.contextPath}/board/myClassBoardFindAll.do",
			success(board) {
				console.log(board);
				
				const tbody = document.querySelector('tbody');
				tbody.innerHTML = "";
				
				if(board.length == 0) {
					tbody.innerHTML = `
						<tr>
				  			<th scope="row">조회된 게시글이 존재하지 않습니다.</th>
				  		</tr>
					`;
				}
				else {
					for(let i=0; i<board.length; i++) {
						
						tbody.innerHTML += `
						    <tr>
						      <th scope="row">\${board[i].postId}</th>
						      <td>\${board[i].title}</td>
						      <td>\${board[i].memberId}</td>
						      <td>\${board[i].postCreatedAt}</td>
						    </tr>
						`;
					}
				}
			}
		});
	});
	// 공지사항 버튼
	document.querySelector('#notice').addEventListener('click', () => {
		board('공지사항');
	});
	// 과제공유 버튼
	document.querySelector('#sharing').addEventListener('click', () => {
		board('과제공유');
	});
	// 게시판 버튼
	document.querySelector('#free').addEventListener('click', () => {
		board('게시판');
	});
	
	function board (e) {
		console.log(e);
		document.querySelector('.btn.btn-outline-success').value = e;
		const btnValue = document.querySelector('.btn.btn-outline-success').value;
		const token = document.tokenFrm._csrf.value;
		
		$.ajax({
			url : "${pageContext.request.contextPath}/board/myClassBoardList.do",
			method : "POST",
			headers: {
                "X-CSRF-TOKEN": token
            },
			data : {
				tag : btnValue
			},
			success(board) {
				console.log(board);
				
				const tbody = document.querySelector('tbody');
				tbody.innerHTML = "";
				
				if(board.length == 0) {
					tbody.innerHTML = `
						<tr>
				  			<th scope="row">조회된 게시글이 존재하지 않습니다.</th>
				  		</tr>
					`;
				}
				else {
					for(let i=0; i<board.length; i++) {
						
						tbody.innerHTML += `
						    <tr>
						      <th scope="row">\${board[i].postId}</th>
						      <td>\${board[i].title}</td>
						      <td>\${board[i].memberId}</td>
						      <td>\${board[i].postCreatedAt}</td>
						    </tr>
						`;
					}
				}
			}
		});
	};
	
	
		
	document.querySelector('#clearBtn').addEventListener('click', () => {
		clearForm();
	});
	
	function clearForm() {
	    const createForm = document.getElementById("createForm");
	    const titleInput = createForm.querySelector("input[name=title]");
	    const contentTextarea = createForm.querySelector("textarea.smallplaceholder");

	    if (titleInput) {
	        titleInput.value = "";
	    }
	    if (contentTextarea) {
	        contentTextarea.value = "";
	    }
	};
	
	document.querySelector('#saveBtn').addEventListener('click', () => {
		document.createFrm.submit();
	});
	
	document.querySelectorAll('.dropdown-item').forEach((dropdown) => {
		dropdown.addEventListener('click', (e) => {
			
			const btn = document.querySelector('.btn.btn-outline-secondary.dropdown-toggle');
			btn.value = e.target.innerHTML;
		});
	});
	</script>
	
</body>
</html>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>