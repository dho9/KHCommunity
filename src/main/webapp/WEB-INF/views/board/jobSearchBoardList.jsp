<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<style>
* {
	margin: 0;
	padding: 0;
	-webkit-touch-callout: none;
}
@font-face {font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');font-weight: normal;font-style: normal;}
body {
	font-family: 'GmarketSansMedium';
}
.card.card-body {
	width: 300px;
	height: 200px;
}
#job {
	margin-left: 28%;
	margin-top: 6%;
}
#loadMoreButton, #loadMoreButtonByFilter {
	width: 70px;
    height: 55px;
}
#loadPrevButton, #loadPrevButtonByFilter {
	width: 70px;
    height: 55px;
}
#loadMoreButton, #loadMoreButtonByFilter {
	margin-left: 36.5%;
	background-color: royalblue;
}
#loadPrevButton, #loadPrevButtonByFilter {
	margin-left: 28%;
	background-color: royalblue;
}
#searchBtn {
    width: 70px;
    height: 42px;
    border-radius: 16px;
    background-color: #f8f8f8;
    margin-top: 4px;
}
#jobDetail {
	display: flex;
    border: 2px solid #4169e173;
    border-radius: 20px;
    padding: 15px;
    width: 838px;
    margin-bottom: 1%;
    height: 25%;
}
#jobDetail:hover {
	background-color: #f9f9f9;
}
#jobDetail a {
	font-weight: bold;
    color: royalblue;
}
#jobDetailCompany {
	width: 320px;
	margin-top: 9%;
    font-size: 27px;
}
#jobDetailCompany a {
	color: #495057;
    text-align: center;
    margin-left: -9px;
    padding: 4px;
}
#keyword {
    width: 80%;
    margin-left: 7%;
    border: none;
}
#keyword-div {
	border: 2px solid royalblue;
    border-radius: 20px;
    width: 28%;
    display: flex;
    margin-right: 6px;
    margin-left: 18px;
}
#search-div {
    margin-top: 3%;
    margin-bottom: -3%;
    display: flex;
    margin-left: 34%;
}
#searchKeyword-div {
	width: 25%;
    height: 5%;
    margin-left: 36%;
    border-radius: 20px;
}
input:focus {
  outline: none;
}
</style>
	
	<!-- 검색 -->
	<div id="search-div">
		<a href="https://www.jobkorea.co.kr/">
			<img style="width: 165px; margin-left: 6%;" alt="" src="${pageContext.request.contextPath}/resources/images/jobkorea.png">
		</a>
		<div id="keyword-div">
			<input type="text" id="keyword" name="keyword" placeholder="NEW JOB, NEW ME!" class="text">
			<img style="border-radius: 50px;" alt="" src="${pageContext.request.contextPath}/resources/images/looking.png">
		</div>
		<button id="searchBtn">검색</button>
	</div>
	
	
	<!-- 채용공고 -->
	<div id="job"></div>
	
	
	<!-- 더보기 -->
	<button class="btn btn-primary" type="button" id="loadPrevButton">
	    이전
	</button>
	<button class="btn btn-primary" type="button" id="loadMoreButton">
	    다음
	</button>
	<button style="visibility: hidden;" class="btn btn-primary" type="button" id="loadPrevButtonByFilter">
	    이전
	</button>
	<button style="visibility: hidden;" class="btn btn-primary" type="button" id="loadMoreButtonByFilter">
	    다음
	</button>
	
	<script>
	let currentPage = 1;
	const itemsPerPage = 10;
	
	
	window.onload = function () {
	    jobSearch(currentPage);
		document.getElementById("loadPrevButton").style.visibility = 'hidden';
	};
	
	document.querySelector('#searchBtn').addEventListener('click', () => {
		jobSearchByFilter(currentPage);
	});
	
	document.querySelector('#keyword').addEventListener('keydown', (e) => {
		if(e.key === 'Enter') {
			e.preventDefault();
			jobSearchByFilter(currentPage);
		}
	});
	
	// 이전
	document.getElementById("loadPrevButton").addEventListener("click", () => {
	    loadPrevJobPostings();
	});
	document.getElementById("loadPrevButtonByFilter").addEventListener("click", () => {
	    loadPrevJobPostingsByFilter();
	});
	
	//다음
	document.getElementById("loadMoreButton").addEventListener("click", () => {
	    loadMoreJobPostings();
		document.getElementById("loadPrevButton").style.visibility = 'visible';
	});
	document.getElementById("loadMoreButtonByFilter").addEventListener("click", () => {
	    loadMoreJobPostingsByFilter();
		document.getElementById("loadPrevButtonByFilter").style.visibility = 'visible';
	});
	
	function loadMoreJobPostings() {
	    currentPage++;
	    if(currentPage == 50) {
	    	document.getElementById("loadMoreButton").style.visibility = 'hidden';
	    }
	    jobSearch(currentPage);
	    window.scrollTo(0, 0);
	}
	function loadMoreJobPostingsByFilter() {
	    currentPage++;
	    if(currentPage == 5) {
	    	document.getElementById("loadMoreButtonByFilter").style.visibility = 'hidden';
	    }
	    jobSearchByFilter(currentPage);
	    window.scrollTo(0, 0);
	}
	
	function loadPrevJobPostings() {
	    currentPage--;
	    if(currentPage == 1) {
	    	document.getElementById("loadPrevButton").style.visibility = 'hidden';
	    }
	    jobSearch(currentPage);
	    window.scrollTo(0, 0);
	}
	function loadPrevJobPostingsByFilter() {
	    currentPage--;
	    if(currentPage == 1) {
	    	document.getElementById("loadPrevButtonByFilter").style.visibility = 'hidden';
	    }
	    jobSearchByFilter(currentPage);
	    window.scrollTo(0, 0);
	}
	
    function jobSearch(pageNumber) {
    	/* console.log('jobSearch:pageNumber=', pageNumber) */
    	$.ajax({
            url: '${pageContext.request.contextPath}/board/jobSearch.do',
            type: 'GET',
            data : {
            	page : pageNumber
            },
            dataType: 'json',
            success: function(response) {
            	/* console.log(response) */
                const jobKoreaList = response.jobKoreaList;
                /* console.log(jobKoreaList); */
                
                render(jobKoreaList);
            }
        });
    }
    
    function jobSearchByFilter(pageNumber) {
    	/* console.log(document.querySelector('#keyword').value); */
		const keyword = document.querySelector('#keyword').value;
		$.ajax({
			url : "${pageContext.request.contextPath}/board/jobSearchByFilter.do",
			data : {
				keyword : keyword,
				page : pageNumber
			},
			success(responseData) {
				/* console.log(responseData); */
				const {currentPage} = responseData;
                const jobKoreaList = responseData.jobKoreaList;
                /* console.log('111111111', jobKoreaList); */
               	document.getElementById("loadPrevButton").style.display = 'none';
               	document.getElementById("loadMoreButton").style.display = 'none';
               	/* document.getElementById("loadPrevButtonByFilter").style.visibility = 'visible';
               	document.getElementById("loadMoreButtonByFilter").style.visibility = 'visible'; */
                if(currentPage == 1) {
                	document.getElementById("loadPrevButtonByFilter").style.visibility = 'hidden';
                	document.getElementById("loadMoreButtonByFilter").style.visibility = 'visible';
                } 
                if (currentPage == 50) {
                	document.getElementById("loadMoreButtonByFilter").style.visibility = 'hidden';
                	document.getElementById("loadPrevButtonByFilter").style.visibility = 'visible';
                }
                render(jobKoreaList);
			}
		});	
    }
    
    function render(jobKoreaList) {
    	/* console.log('render:jobKoreaList=', jobKoreaList); */
    	const job = document.querySelector('#job');
    	job.innerHTML = "";
    	
    	for(let i=0; i<jobKoreaList.length; i++) {
    		const company = jobKoreaList[i].company;
    		const title = jobKoreaList[i].title;
    		const option = jobKoreaList[i].option;
    		let etc = jobKoreaList[i].etc;
    		const url = jobKoreaList[i].url;
    		/* console.log('@@@', company, title, option, etc, url); */
    		
   			if (etc.split(" ").length > 5) {
                etc = etc.split(" ").slice(0, 5).join(" ") + "...";
                   
	    		job.innerHTML += `
	    			<div id="jobDetail"><div id="jobDetailCompany"><a href="\${url}">\${company}</a></div>
			    		<div style="width: 640px; height: 183px;">
			    			<p class="medium" style="font-size: 22px;"><a href="\${url}">\${title}</a></p>
						  	<p class="medium">\${option}</p>
						  	<p class="medium" id="jobDetailEtc">\${etc}</p>
						</div>
					</div>
				`;
               }else{
            	   job.innerHTML += `
   	    			<div id="jobDetail"><div id="jobDetailCompany"><a href="\${url}">\${company}</a></div>
   			    		<div style="width: 640px; height: 183px;">
   			    			<p class="medium" style="font-size: 22px;"><a href="\${url}">\${title}</a></p>
   						  	<p class="medium">\${option}</p>
   						  	<p class="medium" id="jobDetailEtc">\${etc}</p>
   						</div>
   					</div>`;
               }
    	}
    };
    
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
