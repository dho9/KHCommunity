<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<style>
#calendar {
	margin: 3% auto;
	width: 40%;
}

.fc .fc-button-primary:not(:disabled).fc-button-active,
.fc .fc-button-primary:not(:disabled):active {
    background-color: royalblue;
    border-color: royalblue;
    color: white;
}

.fc .fc-button-primary:disabled,
.fc .fc-button-primary {
    background-color: royalblue;
    border-color: royalblue;
    color: white;
}

.fc .fc-button .fc-icon {
    font-size: 1.5em;
    vertical-align: middle;
    background-color: royalblue;
    border-color: royalblue;
    color: white;
}

.fc .fc-button-group > .fc-button {
  z-index: 1;
    background-color: royalblue;
    border-color: royalblue;
    color: white;
}
/* .fc .fc-button-group > .fc-button.fc-button-active,
.fc .fc-button-group > .fc-button:active,
.fc .fc-button-group > .fc-button:focus,
.fc .fc-button-group > .fc-button:hover,
.fc .fc-button-group > .fc-button.fc-button-disabled {
    z-index: 1;
    background-color: royalblue;
    border-color: royalblue;
    color: white;
} */
</style>


<!DOCTYPE html>
<html lang='en'>
<meta charset='utf-8' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script src='../dist/index.global.js'></script>
<script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>

<div id='calendar'></div>

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
        var title = prompt('입력할 일정:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay,
            backgroundColor:"yellow",
            textColor:"blue"
          })
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
    	  console.log("#등록된 일정 클릭#");
    	  console.log(arg.event);
    	  
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, 
      events: function(info, successCallback, failureCallback) {
    	  
    	    $.ajax({
    	        type: "get",
    	        url: "${pageContext.request.contextPath}/calendar.do?method=data",
    	        dataType: "json",
    	        success: function(responseData) {
    	            console.log("responseData =", responseData);

    	            var events = [];
    	            responseData.forEach(function(item) {
    	                var event = {
    	                    title: item.title,
    	                    start: item.start, 
    	                    end: item.end 
    	                };
    	                events.push(event);
    	            });

    	            successCallback(events); 
    	        },
    	        complete: function() {
    	            console.log("완료됐습니다.");
    	        }
    	    });
    	}
    
  });

    calendar.render();
  });

    </script>
</html>