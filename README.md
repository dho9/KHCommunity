# KH TIME
- 스프링부트, jsp를 이용한 커뮤니티 웹 사이트

## 프로젝트 소개
- 에브리타임을 참고하여 개발한 KH정보교육원 커뮤니티 및 행정업무의 일부를 제공

## 개발기간
- 2023.8.17 ~ 2023.09.04

## 멤버구성
- 황대호 : 식권 구매 및 티켓발권 , DB설계 및 구현 , 게시판관련(CRUD)
- 이장준 : 게시판관련(CRUD), 게시글 및 댓글 신고, 스터디 게시판, DB설계 및 구현
- 유성근 : 관리자 페이지, 실시간 상담, 사용자 알림, DB설계 및 구현
- 이태현 : 신고관리, 우리반게시판관리, 식당 추가, 메인페이지 구성, 스토리보드
- 한미루 : 우리반게시판(CRUD), 취업게시판(크롤링), 검색, 즐겨찾기, 공감, 태그, 유스케이스
- 정민희 : 소셜로그인, 회원/직원마이페이지, 쪽지, 캘린더, 메인CSS, 단위업무정의서, 요구사항정의서
- 신희진 : 회원가입, 회원/직원 마이페이지(내정보, 회원수정,회원탈퇴, 휴가), PPT

## 개발환경
- `java 11`
- `jdk 11.0.20`
- **IDE** : STS 3.9.17
- **Framework** : Springboot(2.7.14)
- **DataBase** : Oracle Cloud(19c)
- **ORM** : Mybatis

## 주요기능
### 식권 구매 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/store/storeDetail.jsp
   - 결제 검증
   - 결제API, 카카오공유하기 API, 길찾기 API
     
### 코드질문 게시판 https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/board/askCodeBoardList.jsp
   - 로그인 필수...
   - 코드 편집기 API를 이용한 코드질문 게시판
    
### 채팅 :https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/chat/chatConsultingRequest.jsp
   - 웹소켓, stomp 이용
     
### 실시간 알림 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/java/com/kh/app/notification/service/NotificationServiceImpl.java
    - 게시글 댓글, 대댓글 알림
    - 상담 신청 알림
    - 쪽지 알림
    - 신고 알림
    - 회원 승인 알림
    - 휴가 승인 알림

### 우리반게시판 관리 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/admin/myClassBoardList.jsp
   - 수료생 게시판 초기화
   - 예비생 커리큘럼 설정
     
### 우리반게시판 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/admin/myClassBoardList.jsp
   - 재학생만 이용가능
   - 반마다 고유게시판 부여
   - 공지사항 작성(관리자, 강사만 가능)

### 스터디게시판 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/board/studyBoardList.jsp
   - 로그인 필수
   - 스터디 모집
   - 스터디 지원
   - 스터디마다 고유게시판 부여
   - (팀장만 가능)스터디 끝내기
   - (팀장만 가능)스터디원 관리
   - (팀장만 가능)공지사항 작성

### 스케줄러 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/schedule/fullcalendar.jsp
   - 스케줄 등록
   - 스케쥴 삭제
   - 캘린더 화면 출력
     
### 쪽지 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/java/com/kh/app/messageBox/controller/MessageContoller.java
   - 쪽지보내기
   - 쪽지삭제
   - 쪽지신고
   - 쪽지리스트 출력(쪽지함)
   - 읽음 여부 변경
     
### 학생 마이페이지 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/member/myPage.jsp
   - 학생 수강정보(반, 과목, 강사, 강의실, D-day)
   - 학생 정보 수정
   - 학생 탈퇴
   - 내정보 확인
   - 휴가 신청
   - 식권 구매 목록
   - 학생 인증
   - 상담 내역
     
### 직원 마이페이지 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/member/employeeMyPage.jsp
   - 직원 소속 정보(입사일, 근무일수)
   - 강사 (현재 진행중인 수업정보)
   - 직원 정보 수정
   - 직원 탈퇴
   - 내정보 확인
   - 휴가 승인
   - 식권 구매 목록
   - 학생 목록 조회
  
### 취업정보 게시판 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/java/com/kh/app/board/service/BoardServiceImpl.java
   - 취업정보 조회(크롤링)
   - 취업정보 검색
     
### 관리자페이지 메인 차트 : https://github.com/MinHeeJ/KHCommunity/blob/master/src/main/webapp/WEB-INF/views/admin/adminMain.jsp
   - 데이터 시각화
   - naver billboard API 이용  

## 샘플계정
- 관리자
  
  id : admin
  
  pw : admin
- 사용자

  id : eogh
 
  pw : 1234

