 function showInputForm() {
    const writeButton = document.getElementById("writeArticleButton");
    const articlesContainer = document.querySelector(".articles");

    const formHtml = `
      <form class="hidden" id="createForm">
        <input type="text" id="titleInput" placeholder="제목을 입력하세요" />
        <textarea id="contentTextarea" placeholder="내용을 입력하세요"></textarea>
        <button type="submit">글 작성</button>
        <button type="button" class="cancel" onclick="hideInputForm()">취소</button>
      </form>
    `;

    articlesContainer.insertAdjacentHTML("afterbegin", formHtml);
    const createForm = document.getElementById("createForm");
    const titleInput = document.getElementById("titleInput");
    const contentTextarea = document.getElementById("contentTextarea");

    writeButton.style.display = "none";
    createForm.classList.remove("hidden");
 }
	
  function hideInputForm() {
    const writeButton = document.getElementById("writeArticleButton");
    const createForm = document.getElementById("createForm");

    writeButton.style.display = "block";
    createForm.remove();
  }