<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="rightside">
	<form action="${pageContext.request.contextPath}/board/boardSearch.do"
		class="search">
		<input type="text" name="keyword" placeholder="전체 게시판의 글을 검색하세요!"
			class="text" />
	</form>
	 <div class="card">
        <div class="board" id="popularPostsContainer">
            <h3>
                <a>실시간 인기 글</a>
            </h3>
        </div>
    </div>
	<div class="card">
		<div class="board">
			<h3>
				<a>공지사항</a>
			</h3>
			<a href="" class="article">
				<p class="title">내일 4학년 수강신청 파이팅</p>
				<p class="small">하나도 빼놓지 말고 다 잡으세용</p>
				<h4>자유게시판</h4>
				<ul class="status">
					<li><img
						src="${pageContext.request.contextPath}/resources/images/like.png" /></li>
					<li class="vote active">22</li>
					<li><img
						src="${pageContext.request.contextPath}/resources/images/comment.png" /></li>
					<li class="comment active">7</li>
				</ul>
				<hr>
			</a> <a href="" class="article">
				<p class="title">내일 4학년 수강신청 파이팅</p>
				<p class="small">하나도 빼놓지 말고 다 잡으세용</p>
				<h4>자유게시판</h4>
				<ul class="status">
					<li><img
						src="${pageContext.request.contextPath}/resources/images/like.png" /></li>
					<li class="vote active">22</li>
					<li><img
						src="${pageContext.request.contextPath}/resources/images/comment.png" /></li>
					<li class="comment active">7</li>
				</ul>
				<hr>
			</a> <a href="" class="article">
				<p class="title">내일 4학년 수강신청 파이팅</p>
				<p class="small">하나도 빼놓지 말고 다 잡으세용</p>
				<h4>자유게시판</h4>
				<ul class="status">
					<li><img
						src="${pageContext.request.contextPath}/resources/images/like.png" /></li>
					<li class="vote active">22</li>
					<li><img
						src="${pageContext.request.contextPath}/resources/images/comment.png" /></li>
					<li class="comment active">7</li>
				</ul>
				<hr>
			</a>
		</div>
	</div>
</div>
<script>
window.onload = () => {
    $.ajax({
        url: "${pageContext.request.contextPath}/board/popularPost.do",
        success: function(data) {
            console.log(data);
            const container = $("#popularPostsContainer");
            for (let i = 0; i < data.length; i++) {
                const post = data[i];
                const postHTML = `<a href="${pageContext.request.contextPath}/board/boardDetail.do?id=\${post.postId}" class="article">
                    <p class="title">\${post.title}</p>
                    <p class="small">\${post.content}</p>
                    <h4>\${post.boardName}</h4>
                    <ul class="status">
                        <li><img src="${pageContext.request.contextPath}/resources/images/like.png" /></li>
                        <li class="vote active">\${post.postLike}</li>
                        <li><img src="${pageContext.request.contextPath}/resources/images/comment.png" /></li>
                        <li class="comment active">\${post.commentCount}</li>
                    </ul>
                    <hr>
                </a>`;
                container.append(postHTML);
            }
        }
    });
};
</script>






