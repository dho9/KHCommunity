function showInputForm() {
        const writeButton = document.getElementById("writeArticleButton");
        const articlesContainer = document.querySelector(".articles");

        const formHtml = `
          <form class="hidden" id="createForm">
            <input type="text" id="titleInput" placeholder="제목을 입력하세요" />
            <textarea id="contentTextarea" placeholder="내용을 입력하세요"></textarea>
            <div>
            	<label for="hashTag">해시태그</label><br>
            	<input type="text" class="hashTag" placeholder="Enter로 해시태그를 등록해주세요"/>
            	<div class="hashTag-container"></div>
            </div>
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
        
	    // 해시태그
   		const hashTag = document.querySelector('.hashTag');
	    const hashTagContainer = document.querySelector('.hashTag-container');
	    
	    hashTag.addEventListener('keydown', (e) => {
	    	
	    	if(e.key === 'Enter') {
	    		e.preventDefault();
	    		const tag = hashTag.value.trim();
	    		
	    		addHashTag(tag);
	    		hashTag.value = "";
	    	}
	    });
	    
	    let hashTags = [];
	    
	    function addHashTag(tag) {
	    	tag = tag.replace(/[\s]/g, '').trim();
	    	console.log(tag);
	    	if(!hashTags.includes(tag)) {
	    		const span = document.createElement("span");
	    		span.innerHTML = " #" + tag + " ";
	    		
	    		const removeButton = document.createElement("button");
	    		removeButton.innerHTML = "x";
	    		removeButton.addEventListener('click', () => {
	    			hashTagContainer.removeChild(span);
	    			hashTags = hashTags.filter((hashTags) => hashTags !== tag);
	    		});
	    		
	    		hashTags.push(tag);
	    		
	    		span.appendChild(removeButton);
	    		hashTagContainer.appendChild(span);
	    		span.setAttribute("name", "hashTag");
	    	}
	    }
     }
    	
      function hideInputForm() {
        const writeButton = document.getElementById("writeArticleButton");
        const createForm = document.getElementById("createForm");

        writeButton.style.display = "block";
        createForm.remove();
      }
