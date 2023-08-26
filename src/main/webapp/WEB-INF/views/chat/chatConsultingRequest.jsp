<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatReq.css" />
</head>
<body>

	<section style="background-color: #eee;">
  		<div class="container py-5">

    		<div class="row d-flex justify-content-center">
      			<div class="col-md-10 col-lg-8 col-xl-6">

        			<div class="card" id="chat2">
         				<div class="card-header d-flex justify-content-between align-items-center p-3">
           					<h5 class="mb-0">Chat</h5>
				        	<button type="button" class="btn btn-primary btn-sm" data-mdb-ripple-color="dark">Let's Chat
				              App
				            </button>
          				</div>
          				<div class="card-body" data-mdb-perfect-scrollbar="true" style="position: relative; height: 600px; overflow-y:scroll;">

            			<div class="d-flex flex-row justify-content-start">
              				<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp"
                				alt="avatar 1" style="width: 45px; height: 100%;">
              				<div>
                				<p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">Hi</p>
                				<p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">How are you ...??? </p>
                				<p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">What are you doing tomorrow? Can we come up a bar?</p>
                				<p class="small ms-3 mb-3 rounded-3 text-muted">23:58</p>
              				</div>
            			</div>

            			<div class="divider d-flex align-items-center mb-4">
              				<p class="text-center mx-3 mb-0" style="color: #a2aab7;">Today</p>
            			</div>

            			<div class="d-flex flex-row justify-content-end mb-4 pt-1">
              				<div>
                				<p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">Hiii, I'm good.</p>
                				<p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">How are you doing?</p>
                				<p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">Long time no see! Tomorrow office. will be free on sunday.</p>
                				<p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end">00:06</p>
              				</div>
              				<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava4-bg.webp"
                				alt="avatar 1" style="width: 45px; height: 100%;">
            				</div>

            				<div class="d-flex flex-row justify-content-start mb-4">
              					<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp"
                					alt="avatar 1" style="width: 45px; height: 100%;">
              					<div>
                					<p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">Okay</p>
                					<p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">We will go on Sunday?</p>
                					<p class="small ms-3 mb-3 rounded-3 text-muted">00:07</p>
              					</div>
            				</div>

            				<div class="d-flex flex-row justify-content-end mb-4">
              					<div>
                					<p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">That's awesome!</p>
                					<p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">I will meet you Sandon Square sharp at 10 AM</p>
                					<p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">Is that okay?</p>
                					<p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end">00:09</p>
              					</div>
              					<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava4-bg.webp" alt="avatar 1" style="width: 45px; height: 100%;">
            				</div>

            				<div class="d-flex flex-row justify-content-start mb-4">
              					<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp" alt="avatar 1" style="width: 45px; height: 100%;">
              					<div>
                					<p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">Okay i will meet you on Sandon Square</p>
                					<p class="small ms-3 mb-3 rounded-3 text-muted">00:11</p>
              					</div>
            				</div>

            				<div class="d-flex flex-row justify-content-end mb-4">
              					<div>
                					<p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">Do you have pictures of Matley Marriage?</p>
                					<p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end">00:11</p>
              					</div>
              					<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava4-bg.webp" alt="avatar 1" style="width: 45px; height: 100%;">
            				</div>

            				<div class="d-flex flex-row justify-content-start mb-4">
              					<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp" alt="avatar 1" style="width: 45px; height: 100%;">
              					<div>
                					<p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;">Sorry I don't have. i changed my phone.</p>
                					<p class="small ms-3 mb-3 rounded-3 text-muted">00:13</p>
              					</div>
            				</div>

            				<div class="d-flex flex-row justify-content-end">
              					<div>
                					<p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">Okay then see you on sunday!!</p>
                					<p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end">00:15</p>
              					</div>
              					<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava4-bg.webp" alt="avatar 1" style="width: 45px; height: 100%;">
            				</div>

          				</div>
          				<div class="card-footer text-muted d-flex justify-content-start align-items-center p-3">
            				<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp" alt="avatar 3" style="width: 40px; height: 100%;">
            				<input type="text" class="form-control form-control-lg" id="exampleFormControlInput1" placeholder="Type message">
            					<a class="ms-1 text-muted" href="#!"><i class="fas fa-paperclip"></i></a>
            					<a class="ms-3 text-muted" href="#!"><i class="fas fa-smile"></i></a>
            					<a class="ms-3" href="#!"><i class="fas fa-paper-plane"></i></a>
          				</div>
        			</div>

				</div>
    		</div>

  		</div>
</section>

</body>
</html>