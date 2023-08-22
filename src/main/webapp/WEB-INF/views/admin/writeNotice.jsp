<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/common/adminLeftBar.jsp" %>
<style>
  .ck-editor__editable { height: 400px; }
</style>
    <section>
      <div class="card" style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
          <div class="card-header flex" id="todayIssueHeader">
			    <div class="d-flex justify-content-between align-items-center" >
			        <span class="mb-0" style="font-weight: 900;">공지사항 작성 &nbsp;&nbsp;&nbsp;</span>
			    </div>
		  </div>
          <div class="card-body" id="todayIssueBody">
              <form action="" method="POST">
			      <textarea name="text" id="editor"></textarea>
			    <p><input type="submit" value="전송"></p>
			    </form>
		  </div>
      </div>
    </section>
    <footer></footer>
  </body>
</html>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor/build/ckeditor.js"></script>
    <script>
      ClassicEditor.create( document.querySelector( '#editor' ) );
    </script>
