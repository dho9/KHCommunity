<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="pay_btn" onclick="requestPay({{ auth()->check() }})">결제하기</button>
</body>
</html>