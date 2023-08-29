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


	<!-- 직무선택 -->
	<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	    직무선택
	</button>
	<div class="collapse" id="collapseExample">
	  <div class="card card-body">
	  	<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="jobType" value="백엔드개발자" id="flexCheckDefault" >
		  <label class="form-check-label" for="flexCheckDefault">백엔드개발</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="jobType" value="프론트엔드개발자" id="flexCheckChecked" >
		  <label class="form-check-label" for="flexCheckChecked">프론트엔드개발</label>
		</div>
      	<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="jobType" value="웹개발자" id="flexCheckDefault" >
		  <label class="form-check-label" for="flexCheckDefault">웹개발</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="jobType" value="앱개발자" id="flexCheckChecked" >
		  <label class="form-check-label" for="flexCheckChecked">앱개발</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="jobType" value="소프트웨어개발자" id="flexCheckChecked" >
		  <label class="form-check-label" for="flexCheckChecked">소프트웨어개발</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="jobType" value="게임개발자" id="flexCheckChecked" >
		  <label class="form-check-label" for="flexCheckChecked">게임개발</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="jobType" value="하드웨어개발자" id="flexCheckChecked" >
		  <label class="form-check-label" for="flexCheckChecked">하드웨어개발</label>
		</div>
	  </div>
	</div>
	<!-- 근무지역 -->
	<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	    근무지역
	</button>
    <div class="collapse" id="collapseExample">
        <div class="card card-body">
            <button class="btn btn-link" onclick="showLocations(['서울전체', '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', 
            																'노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구	', '서초구', '성동구', '성북구', '송파구',
            																'양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구']);">서울</button>
            <button class="btn btn-link" onclick="showLocations(['경기전체', '가평군', '고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시',
            																'남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', 
            																'안성시', '안양시', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시', '의왕시',
            																'의정부시', '이천시', '파주시', '평택시', '포천시', '하남시', '화성시']);">경기</button>
            <button class="btn btn-link" onclick="showLocations(['인천전체', '강화군', '계양구', '미추홀구', '남동구', '동구', '부평구', '서구', '연수구', '옹진군', '중구']);">인천</button>
            <div id="locationDetail"></div>
        </div>
    </div>
    
	<!-- 경력 -->
	<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	    경력
	</button>
	<div class="collapse" id="collapseExample">
	  <div class="card card-body">
	  	<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="career" value="신입" id="flexCheckDefault" >
		  <label class="form-check-label" for="flexCheckDefault">신입</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="career" value="경력" id="flexCheckChecked" >
		  <label class="form-check-label" for="flexCheckChecked">1~3년</label>
		</div>
      	<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="career" value="경력" id="flexCheckDefault" >
		  <label class="form-check-label" for="flexCheckDefault">4~6년</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="career" value="경력" id="flexCheckChecked" >
		  <label class="form-check-label" for="flexCheckChecked">7~9년</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="career" value="경력" id="flexCheckChecked" >
		  <label class="form-check-label" for="flexCheckChecked">10~15년</label>
		</div>
	  </div>
	</div>
	
	<!-- 검색 버튼 -->
	<button class="btn btn-primary" type="button" onclick="searchJobKorea()">
	    검색
	</button>
	
	<!-- 채용공고 -->
	<div id="job"></div>
	
	
	<!-- 더보기 -->
	<button class="btn btn-primary" type="button" id="loadPrevButton">
	    이전
	</button>
	<button class="btn btn-primary" type="button" id="loadMoreButton">
	    다음
	</button>
	
	<script>
	// 이전/다음
	let currentPage = 1;
	const itemsPerPage = 10;
	
	document.getElementById("loadPrevButton").addEventListener("click", () => {
	    loadPrevJobPostings();
	});
	
	document.getElementById("loadMoreButton").addEventListener("click", () => {
	    loadMoreJobPostings();
		document.getElementById("loadPrevButton").style.display = 'inline-block';
	});
	
	window.onload = function () {
	    jobSearch(currentPage);
		document.getElementById("loadPrevButton").style.display = 'none';
	};
	
	function loadMoreJobPostings() {
	    currentPage++;
	    if(currentPage == 50) {
	    	document.getElementById("loadMoreButton").style.display = 'none';
	    }
	    jobSearch(currentPage);
	}
	
	function loadPrevJobPostings() {
	    currentPage--;
	    if(currentPage == 1) {
	    	document.getElementById("loadPrevButton").style.display = 'none';
	    }
	    jobSearch(currentPage);
	}
	
    function jobSearch(pageNumber) {
    	console.log('!!!!!!!!!!!!!!!', pageNumber)
    	$.ajax({
            url: '${pageContext.request.contextPath}/board/jobSearch.do',
            type: 'GET',
            data : {
            	page : pageNumber
            },
            dataType: 'json',
            success: function(response) {
                const jobKoreaList = response.jobKoreaList;
                console.log(jobKoreaList);
                
                render(jobKoreaList);
            }
        });
    }
    
    function render(jobKoreaList) {
    	const job = document.querySelector('#job');
    	job.innerHTML = "";
    	
    	for(let i=0; i<jobKoreaList.length; i++) {
    		const company = jobKoreaList[i].company;
    		const title = jobKoreaList[i].title;
    		const option = jobKoreaList[i].option;
    		const etc = jobKoreaList[i].etc;
    		const url = jobKoreaList[i].url;
    		
    		if(title != "") {
	    		job.innerHTML += `<div style="display: flex;"><div style="width: 500px;"><a href="\${url}">\${company}</a></div>
	    		<div style="width: 500px;">
	    			<p class="medium"><a href="\${url}">\${title}</a></p> <br>
				  	<p class="medium">\${option}</p> <br>
				  	<p class="medium">\${etc}</p> <br>
				</div>
				</div>
	    		`;
    		}
    	}
    };
    
    // 검색
    function searchJobKorea(jobKoreaList) {
		const filterList = [];
	    const jobTypeCheckboxes = document.querySelectorAll('input[name="jobType"]:checked');
	    jobTypeCheckboxes.forEach(checkbox => {
	    	filterList.push(checkbox.value);
	    });
	    
	    const locationCheckboxes = document.querySelectorAll('input[name="location"]:checked');
	    locationCheckboxes.forEach(checkbox => {
	    	filterList.push(checkbox.value);
	    });
	    
	    const careerCheckboxes = document.querySelectorAll('input[name="career"]:checked');
	    careerCheckboxes.forEach(checkbox => {
	    	filterList.push(checkbox.value);
	    });
	    
	    console.log(filterList);
	    filter(filterList, currentPage);
	    
	}
	
	function filter(filterList, currentPage) {
		$.ajax({
            url: '${pageContext.request.contextPath}/board/jobSearchByFilter.do',
            data : {
            	page : pageNumber,
            	filterList : filterList
            },
            success: function(response) {
                const jobKoreaList = response.jobKoreaList;
                console.log(jobKoreaList);
                
                render(jobKoreaList);
            }
        });
	}
    
	// 전체체크박스
	function showLocations(locations) {
		const locationDetail = document.getElementById("locationDetail");
	    locationDetail.innerHTML = "";
	
	    const mainLocation = locations[0];
	
	    const mainLocationCheckbox = document.createElement("input");
	    mainLocationCheckbox.classList.add("form-check-input");
	    mainLocationCheckbox.type = "checkbox";
	    mainLocationCheckbox.value = mainLocation;
	    mainLocationCheckbox.id = `flexCheck${mainLocation}`;
	    mainLocationCheckbox.checked = false; // 처음에는 비활성화 상태로 설정
	
	    mainLocationCheckbox.addEventListener("change", () => {
	        const subCheckboxes = locationDetail.querySelectorAll(".form-check-input");
	        for (const checkbox of subCheckboxes) {
	            checkbox.checked = mainLocationCheckbox.checked;
	        }
	    });
	
	    const mainLocationLabel = document.createElement("label");
	    mainLocationLabel.classList.add("form-check-label");
	    mainLocationLabel.htmlFor = `flexCheck${mainLocation}`;
	    mainLocationLabel.textContent = mainLocation;
	
	    const mainLocationItem = document.createElement("div");
	    mainLocationItem.classList.add("form-check");
	    mainLocationItem.appendChild(mainLocationCheckbox);
	    mainLocationItem.appendChild(mainLocationLabel);
	    locationDetail.appendChild(mainLocationItem);
	
	    for (const subLocation of locations.slice(1)) {
	        const subLocationItem = document.createElement("div");
	        subLocationItem.classList.add("form-check");
	        subLocationItem.innerHTML = `
	            <input class="form-check-input" type="checkbox" value="\${subLocation}" name="location">
	            <label class="form-check-label" for="flexCheck${subLocation}">\${subLocation}</label>
	        `;
	        locationDetail.appendChild(subLocationItem);
	    }
	}
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>