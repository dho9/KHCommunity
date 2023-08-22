<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/common/adminLeftBar.jsp"%>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style.css" />
<style>
nav {
    position: fixed;
    z-index: 100;
    left: 0;
    top: 0;
    width: 1300px;
    height: 80px;
    border-bottom: 1px solid #d6d6d6;
    background-color: #fff;
}
a {
color : white;
}
#createForm {
    position: relative;
    margin-bottom: 5px;
    border: 2px solid #d6d6d6;
    box-sizing: border-box;
}
#createForm p {
    padding: 15px;
    border-bottom: 1px solid #e3e3e3;
    background-color: #fff;
}
#createForm p input.title{
	width: 100%;
    height: 20px;
    line-height: 20px;
    border: 0;
    font-size: 16px;
    font-weight: bold;
}
#createForm button{
	width: 59px;
	height: 59px;
	border: none;
}

#createForm p textarea.smallplaceholder{
	width: 100%;
    height: 350px;
    border: 0;
    font-size: 14px;
    resize: none;
}
#createForm label{
    font-size: 18px;
    font-weight: bold;
    margin-left: 1%;
}
#writeArticleButton {
    width: 780px;
    display: block;
    padding: 15px;
    border: solid 3px lightgray;
    font-size: 17px;
    margin-bottom: 5px;
    background-color: #f9f9f9;
}
element.style {
    height: 550px;
    display: contents;
}
</style>
<%-- 글작성 아이콘 --%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<section>
	<div class="card"
		style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
		<div class="card-header flex" id="todayIssueHeader">
			<div class="d-flex justify-content-between align-items-center">
				<span class="mb-0" style="font-weight: 900;">공지사항 작성
					&nbsp;&nbsp;&nbsp;</span>
			</div>
		</div>
		<div class="card-body" id="todayIssueBody">
			<form:form class="hidden" action="${pageContext.request.contextPath}/admin/writeNotice.do" id="createForm" method="POST" style="height: 550px;">
	      	<input type = "hidden" name="boardId" id="boardId" value="10">
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
 	    <input class="file" type="file" name="file" multiple="multiple">
        <button type="button" class="btn btn-secondary cancel" onclick="clearForm()" style="float: right;border-left: solid 3px white;">취소</button>
        <button style="float: right;" type="submit" class="btn btn-primary"><span class="material-symbols-outlined">edit</span></button>
	      </form:form>
		</div>
	</div>
</section>
<footer></footer>
<script>
  function clearForm() {
    const createForm = document.getElementById("createForm");
    const titleInput = createForm.querySelector("input.title");
    const contentTextarea = createForm.querySelector("textarea.smallplaceholder");

    titleInput.value = "";
    contentTextarea.value = "";
  }
</script>
<script>
      $(function(){
        var accordionButton = $('.list .items > .a_title');
        accordionButton.on('click', function(e){
          e.preventDefault();
          var $this = $(this);
          var target = $this.parent();
          var description = $this.siblings('.a_content');
          var other = target.siblings('.items');
          var otherDescription = other.find('.a_content');
          accordionToggle(target, description, other, otherDescription);
        });
        
        function accordionToggle(target, description, other, otherDescription){
          if (target.hasClass('active')) {
              target.removeClass('active');
              description.stop().slideUp(300);
          } else {
              target.addClass('active');
              description.stop().slideDown(300);
          }
          if (other && otherDescription) {
              other.removeClass('active');
              otherDescription.stop().slideUp(300);
          }
        };
      });
</script>
</body>
</html>