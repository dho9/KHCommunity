<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style>

@font-face {font-family: 'HakgyoansimWoojuR'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2') format('woff2'); font-weight: normal; font-style: normal;}
@font-face {font-family: 'MBC1961GulimM'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2') format('woff2'); font-weight: normal; font-style: normal;}
@font-face {font-family: 'NanumSquareNeo-Variable'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2'); font-weight: normal; font-style: normal;}
#calendar {margin: 3% auto; width: 50%;}
.fc .fc-button-primary:not(:disabled).fc-button-active,
.fc .fc-button-primary:not(:disabled):active {background-color: royalblue; border-color: royalblue; color: white;}
.fc .fc-button-primary:disabled,
.fc .fc-button-primary { background-color: royalblue; border-color: royalblue; color: white;}
.fc .fc-button .fc-icon { font-size: 1.5em; vertical-align: middle; background-color: royalblue; border-color: royalblue; color: white;}
.fc .fc-button-group > .fc-button {z-index: 1; background-color: royalblue; border-color: royalblue; color: white;}
.fc .fc-toolbar-title {margin-right: 60px;}

#calendarTitle {font-family: 'MBC1961GulimM'; font-size: 50px; color: royalblue; margin: 3% 20% 1% 25%; text-shadow: 1px 1px 0 grey;}
.modal {display: none; position: fixed;z-index: 1; left: 0;top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.4); animation: fadeIn 0.3s ease-in-out;}
@keyframes fadeIn {from {opacity: 0;} to { opacity: 1;}}
.modal-content { background-color: white; margin: 40% auto; padding: 20px; border: 1px solid #888; width: 100%; position: relative; animation: slideIn 0.3s ease-in-out;}
@keyframes slideIn {from {transform: translateY(-100px);} to {transform: translateY(0);}}
.close {color: #aaaaaa; position: absolute; top: 10px; right: 20px; font-size: 28px; font-weight: bold;}
#calTitleDiv {vertical-align: middle;}
#calTitleDiv h1{display:inline-block;}
#openModalButton{display:inline-block; width: 150px; font-family: 'NanumSquareNeo-Variable'; font-size: 20px; height: 55px; border-radius: 20px; margin-top: -25;}
.toast{background-color: grey; width: 20%}

</style>


<!DOCTYPE html>
<html lang='en'>
<meta charset='utf-8' name="viewport" content="width=device-width, initial-scale=1">
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script src='../dist/index.global.js'></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });
</script>

<div id="calTitleDiv">    
<h1 id="calendarTitle">Schedule <i class="bi bi-calendar-heart"></i></h1>
<button type="button" class="btn btn-outline-primary" id="openModalButton">Add Event</button>
</div>

<!-- <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="toast-header">
    <strong class="me-auto">Bootstrap</strong>
    <small>11 mins ago</small>
    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close">123</button>
  </div>
  <div class="toast-body">
    Hello, world! This is a toast message.
  </div>
</div> -->

<div id='calendar'></div>
<div class="modal" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="eventModalLabel">일정 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeModalButton">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<sec:authentication property="principal" var="loginMember"/>
        <form:form id="eventForm" action="${pageContext.request.contextPath}/calendar/calendar.do?method=data" method="post">
          <div class="form-group">
          	<input type="hidden" name="memberId" id="memberId" value="${loginMember.username}">
            <label for="eventTitle">일정 내용</label>
            <input type="text" class="form-control" id="eventTitle" name="eventTitle">
          </div>
          <div class="form-group">
            <label for="startDate">시작 날짜</label>
            <input type="date" class="form-control" id="startDate" name="start">
          </div>
          <div class="form-group">
            <label for="endDate">종료 날짜</label>
            <input type="date" class="form-control" id="endDate" name="end">
          </div>
          <div class="form-group">
            <label for="colorSelect">색상</label>
            <select class="form-control" id="colorSelect" name="colorSelect">
           		<option value="royalblue" selected>표시할 색상을 선택해주세요.</option>
  				<option value="red">빨강</option>
  				<option value="royalblue">파랑</option>
  				<option value="#ffd000">노랑</option>
  				<option value="green">초록</option>
  				<option value="#a116f2">보라</option>
			</select>
			<input type="hidden" name="backgroundColor" id="backgroundColor">
           </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary" id="saveEventButton">저장</button>
      </div>
        </form:form>
      </div>
    </div>
  </div>
</div>


<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth'
      },
      initialDate: new Date(),
      navLinks: true, 
      selectable: true,
      selectMirror: true,
      select: function(arg) {
    	console.log(arg);
        var eventTitle = prompt('입력할 일정:');
        if (eventTitle) {
          calendar.addEvent({
            title: eventTitle,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay,
            backgroundColor:"royalblue",
            textColor:"white"
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
    	  console.log("#등록된 일정 클릭#");
    	  console.log(arg.event);
    	  
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove();
          /* $.ajax({
              type: 'POST',
              url: "${pageContext.request.contextPath}/calendar/calendar.do?method=delete", 
              data: arg, 
              beforeSend: function(xhr) {
                  xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')},
              contentType: 'application/json', // 데이터 타입 지정
              success: function(response) {
                console.log('삭제 데이터 전송 성공:', response);
                
              },
              error: function(xhr, textStatus, errorThrown) {
                console.error('오류 발생:', errorThrown);
              }
            });*/
          
        }
      },
      editable: true,
      dayMaxEvents: true, 
      events: function(info, successCallback, failureCallback) {   	  
    	    $.ajax({
    	        type: "get",
    	        url: "${pageContext.request.contextPath}/calendar/calendar.do?method=data",
    	        dataType: "json",
    	        success: function(responseData) {
    	            console.log("responseData =", responseData);

    	            var events = [];
    	            responseData.forEach(function(item) {
    	                var event = {
    	                    title: item.title,
    	                    start: item.start,
    	                    end: item.end,
    	                    backgroundColor: item.backgroundColor,
    	                    borderColor: item.backgroundColor
    	                };
    	                events.push(event);
    	            });

    	            successCallback(events); 
    	        }
    	    });
    	},
    	displayEventTime: false
      

    });
    
 	// 모달 관련 코드
    var openModalButton = document.getElementById('openModalButton');
    var closeModalButton = document.getElementById('closeModalButton');
    var eventModal = document.getElementById('eventModal');

    openModalButton.addEventListener('click', function() {
      eventModal.style.display = 'block';
    });

    closeModalButton.addEventListener('click', function() {
      eventModal.style.display = 'none';
    });

    window.addEventListener('click', function(event) {
      if (event.target == eventModal) {
        eventModal.style.display = 'none';
        
      }
    });
    
    var saveEventButton = document.getElementById('saveEventButton');
    var eventForm = document.getElementById('eventForm');
    var colorSelect = document.getElementById('colorSelect');

    saveEventButton.addEventListener('click', function() {
    	
    	const startInput = document.getElementById('startDate');
    	const endInput = document.getElementById('endDate');
    	const form = document.getElementById('eventForm');
    	const title = document.getElementById('eventTitle');
        
        const startDate = new Date(startInput.value);
        const endDate = new Date(endInput.value);
		
        if (title) {
        	alert('일정 내용은 반드시 입력해야합니다.');
        	form.preventDefault(); 
       	}
        
        if (startDate > endDate) {
        	alert('시작 날짜는 종료 날짜보다 미래일 수 없습니다.');
        	form.preventDefault(); 
       	}
       
    	
      /* event.preventDefault();
      
      var formData = new FormData(eventForm);
      var title = formData.get('eventTitle');
      var startDate = formData.get('startDate');
      var endDate = formData.get('endDate');
      var color = formData.get('colorSelect');
      var backgroundColor = formData.get('backgroundColor');
      var memberId = formData.get('calId');
      
      */

	  /*
      var eventData = {
        title: title,
        start: startDate,
        end: endDate,
        backgroundColor: backgroundColor,
        memberId : memberId
      };

      $.ajax({
        type: 'POST',
        url: "${pageContext.request.contextPath}/calendar/calendar.do?method=data", // 실제 컨트롤러 URL로 변경
        data: formData, 
        beforeSend: function(xhr) {
            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}')},
        contentType: 'application/json', // 데이터 타입 지정
        success: function(response) {
          // 성공적으로 데이터를 전송한 후 처리할 내용
          console.log('이벤트 데이터 전송 성공:', response);
          eventModal.style.display = 'none'; // 모달 닫기
          // 원하는 동작 수행 (ex: 일정을 캘린더에 추가)
        },
        error: function(xhr, textStatus, errorThrown) {
          // 오류 발생 시 처리할 내용
          console.error('오류 발생:', errorThrown);
          // 오류 처리에 대한 추가 작업 수행
        }
      }); */
      
      
      
    });
    calendar.render();
  });

  document.getElementById('colorSelect').addEventListener('change', function() {
	 document.getElementById('backgroundColor').value = document.getElementById('colorSelect').value;
     console.log(document.getElementById('backgroundColor').value);
  });
  
  
  
</script>
</html>