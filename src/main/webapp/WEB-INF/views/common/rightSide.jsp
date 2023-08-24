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
                <a>주간 인기글</a>
            </h3>
        </div>
    </div>
	<div class="card">
		<div class="board" id="noticeBoardsContainer">
			<h3>
				<a>공지사항</a>
			</h3>
		</div>
	</div>
</div>
<script>

window.onload = () => {
	loadNoticeBoards();
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
                        <li class="vote active">\${post.likeCount}</li>
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

async function loadNoticeBoards() {
	const response = await fetch("${pageContext.request.contextPath}/board/noticeBoard.do");
    const data = await response.json();
    
    const container  = $("#noticeBoardsContainer");
    for (let i = 0; i < data.length; i++) {
        const post = data[i];
        const postHTML = `<a href="${pageContext.request.contextPath}/board/boardDetail.do?id=\${post.postId}" class="article">
            <p class="title">\${post.title}</p>
            <p class="small">\${post.content}</p>
            <h4>공지사항 게시판</h4>
            <hr>
        </a>`;
        container.append(postHTML);
    }
}
</script>






