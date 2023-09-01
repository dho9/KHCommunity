<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/common/adminLeftBar.jsp"%>
<style>
*{box-sizing: border-box; /*전체에 박스사이징*/ outline: none; /*focus 했을때 테두리 나오게 */}
body{font-family: 'Noto Sans KR', sans-serif; font-size:16px; background-color: #f5f6f7; line-height: 1.5em; margin: 0;}
a{text-decoration: none;}
.member{width: 400px; margin: auto;padding: 0 20px;margin-bottom: 20px;}
.member .logo{display: block;margin :50px auto;}
.member .field{margin :5px 0;}
.member b{display: block;margin-bottom: 5px;}
.member input:not(input[type=radio]),.member select{border: 1px solid #dadada;padding: 15px;width: 100%;margin-bottom: 5px;}
.member input[type=button],
.member input[type=submit]{background-color: #0a53be;color:#fff}
.member input:focus, .member select:focus{border: 1px solid #2db400;}
.field.birth div{display: flex;gap:10px;}
.placehold-text{display: block;position:relative;}
.field.subject div{
    border: 1px solid #dadada;
    padding: 15px 5px;
    background-color: #fff;
}
</style>
<section>
	<div class="card"
		style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
		<div class="card-header" id="todayIssueHeader">직원 등록</div>
		<div class="card-body" id="todayIssueBody">
			<div class="member">
				<img class="logo" src="${pageContext.request.contextPath}/resources/images/kh admin logo.png">
				<div class="field">
					<b>아이디</b><input type="text" name="id"></span>
				</div>
				<div class="field">
					<b>비밀번호</b> <input class="userpw" type="password" name="pw">
				</div>
				<div class="field">
					<b>이름</b> <input type="text" name="name">
				</div>
				<div class="field birth">
				    <b>생년월일</b>
				    <div>
				        <input type="text" placeholder="ex)20/02/02" name="birthday">
				    </div>
				</div>
				<div class="field">
					<b>본인 확인 이메일</b> <input type="email" name="email">
				</div>
				<div class="field tel-number">
					<b>휴대전화</b>
					<div>
						<input type="text" placeholder="ex)010-1234-1234" name="phone">
					</div>
				</div>
		        <div class="field subject">
				    <b>과목</b>
				    <div>
				        <label><input type="radio" name="subject" value="자바">자바</label>
				        <label><input type="radio" name="subject" value="정보보안">정보보안</label>
				    </div>
				</div>
				<input type="submit" value="등록하기">
			</div>
		</div>
	</div>
	<form:form
    	action="${pageContext.request.contextPath}/admin/insertTeacher.do" 
	    name="insertTeacherFrm" 
	    method="POST">
    	<input type="hidden" name="id" value = "">
    	<input type="hidden" name="pw" value = "">
    	<input type="hidden" name="name" value = "">
    	<input type="hidden" name="birthday" value = "">
    	<input type="hidden" name="email" value = "">
    	<input type="hidden" name="phone" value = "">
    	<input type="hidden" name="subject" value = "">
    </form:form>
</section>
<footer></footer>
<script>
    $(function() {
        // "등록하기" 버튼 클릭 시
        $("input[type='submit']").on('click', function(e) {
            e.preventDefault(); // 기본 동작 중지 (폼 제출 방지)

            // 사용자 입력 값을 가져와서 변수에 저장
            const id = $("input[name='id']").val();
            const pw = $("input[name='pw']").val();
            const name = $("input[name='name']").val();
            const birthday = $("input[name='birthday']").val();
            const email = $("input[name='email']").val();
            const phone = $("input[name='phone']").val();
            const subject = $("input[name='subject']:checked").val(); // 선택된 부서 값 가져오기
            // 가져온 값들을 폼에 설정
            $("form[name='insertTeacherFrm'] input[name='id']").val(id);
            $("form[name='insertTeacherFrm'] input[name='pw']").val(pw);
            $("form[name='insertTeacherFrm'] input[name='name']").val(name);
            $("form[name='insertTeacherFrm'] input[name='birthday']").val(birthday);
            $("form[name='insertTeacherFrm'] input[name='email']").val(email);
            $("form[name='insertTeacherFrm'] input[name='phone']").val(phone);
            $("form[name='insertTeacherFrm'] input[name='subject']").val(subject);

            // 폼 제출
            $("form[name='insertTeacherFrm']").submit();
        });
    });
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>
<script>
	$(function() {
		var accordionButton = $('.list .items > .a_title');
		accordionButton.on('click', function(e) {
			e.preventDefault();
			var $this = $(this);
			var target = $this.parent();
			var description = $this.siblings('.a_content');
			var other = target.siblings('.items');
			var otherDescription = other.find('.a_content');
			accordionToggle(target, description, other, otherDescription);
		});

		function accordionToggle(target, description, other, otherDescription) {
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
		}
		;
	});
</script>
</body>
</html>
