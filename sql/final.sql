--=============================================
-- 계정
--=============================================

--alter session set "_oracle_script" = true;
--
--create user kh
--identified by kh
--default tablespace users;
--
--alter user kh quota unlimited on users;
--
--grant connect, resource to kh;


--=============================================
-- 테이블 삭제
--=============================================
--DROP TABLE member CASCADE CONSTRAINTS;
--DROP TABLE class CASCADE CONSTRAINTS;
--DROP TABLE subject CASCADE CONSTRAINTS;
--DROP TABLE teacher CASCADE CONSTRAINTS;
--DROP TABLE employee CASCADE CONSTRAINTS;
--DROP TABLE board CASCADE CONSTRAINTS;
--DROP TABLE post_content CASCADE CONSTRAINTS;
--DROP TABLE post_attachment CASCADE CONSTRAINTS;
--DROP TABLE favorite CASCADE CONSTRAINTS;
--DROP TABLE report CASCADE CONSTRAINTS;
--DROP TABLE talker CASCADE CONSTRAINTS;
--DROP TABLE store CASCADE CONSTRAINTS;
--DROP TABLE ticket CASCADE CONSTRAINTS;
--DROP TABLE ticket_order CASCADE CONSTRAINTS;
--DROP TABLE student_attachment CASCADE CONSTRAINTS;
--DROP TABLE vacation_attachment CASCADE CONSTRAINTS;
--DROP TABLE student CASCADE CONSTRAINTS;
--DROP TABLE scheduler CASCADE CONSTRAINTS;
--DROP TABLE vacation CASCADE CONSTRAINTS;
--DROP TABLE post CASCADE CONSTRAINTS;
--DROP TABLE post_comment CASCADE CONSTRAINTS;
--DROP TABLE message_box CASCADE CONSTRAINTS;
--DROP TABLE chat_room CASCADE CONSTRAINTS;
--DROP TABLE chat_message CASCADE CONSTRAINTS;
--DROP TABLE authority CASCADE CONSTRAINTS;

--=============================================
-- 테이블 전체 삭제
--=============================================
-- BEGIN
--    FOR tab IN (SELECT table_name FROM user_tables) LOOP
--        EXECUTE IMMEDIATE 'DROP TABLE ' || tab.table_name || ' CASCADE CONSTRAINTS';
--    END LOOP;
-- END;
-- /
--=============================================
-- 계정에 속한 모든 시퀀스를 삭제합니다.
--=============================================
-- BEGIN
--    FOR seq IN (SELECT sequence_name FROM user_sequences WHERE sequence_name LIKE 'SEQ\_%' ESCAPE '\') LOOP
--        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || seq.sequence_name;
--    END LOOP;
-- END;
-- /
--=============================================
-- 계정에 속한 모든 트리거를 삭제합니다.
--=============================================
--BEGIN
--    FOR trg IN (SELECT trigger_name FROM user_triggers) LOOP
--        EXECUTE IMMEDIATE 'DROP TRIGGER ' || trg.trigger_name;
--    END LOOP;
-- END;
-- /


--===============================================
-- 시퀀스 삭제
--===============================================
--drop sequence seq_student_attach_id;
--drop sequence seq_schedule_id;
--drop sequence seq_vacation_id;
--drop sequence seq_vacation_attach_id;
--drop sequence seq_board_id;
--drop sequence seq_post_id;
--drop sequence seq_post_attach_id;
--drop sequence seq_comment_id;
--drop sequence seq_message_id;
--drop sequence seq_report_id;
--drop sequence seq_chat_id;
--drop sequence seq_store_id;
--drop sequence seq_ticket_id;
--drop sequence seq_order_id;
--drop sequence seq_chat_message_no;
--===============================================
-- 시퀀스 생성
--===============================================
create sequence seq_student_attach_id;
create sequence seq_schedule_id;
create sequence seq_vacation_id;
create sequence seq_vacation_attach_id;
create sequence seq_board_id;
create sequence seq_post_id;
create sequence seq_post_attach_id;
create sequence seq_comment_id;
create sequence seq_message_id;
create sequence seq_report_id;
create sequence seq_chat_id;
create sequence seq_store_id;
create sequence seq_ticket_id;
create sequence seq_order_id;
create sequence seq_chat_message_no;
create sequence seq_curriculum_id;
--===============================================
-- 테이블 생성
--===============================================

CREATE TABLE member (
   member_id   varchar2(20)      NOT NULL,
   member_pwd   varchar2(300)   ,
   member_name   varchar2(10),
   member_phone   varchar2(20),
   member_email   varchar2(100),
   birthday   date
);

CREATE TABLE authority (
   member_id   varchar2(20)      NOT NULL,
   auth   varchar2(20)      NOT NULL
);

CREATE TABLE student (
   student_id   varchar2(20)      NOT NULL,
   curriculum_id   number,
   student_enroll_dated   date   DEFAULT sysdate   NULL,
   approve_check   char(1)      ,
   student_type   char(1)      
);


CREATE TABLE class (
   class_id   varchar2(20)      NOT NULL
);

CREATE TABLE curriculum (
   curriculum_id   number      NOT NULL,
   class_id   varchar2(20)      NOT NULL,
   teacher_id   varchar2(20)      NOT NULL,
   subject   varchar2(10),
   curriculum_name   varchar(300),
   curriculum_start_at   date,
   curriculum_end_at   date
);

CREATE TABLE teacher (
   teacher_id   varchar2(20)      NOT NULL,
   teacher_enroll_date   date
);

CREATE TABLE employee (
   employee_id   varchar2(20)      NOT NULL,
   job_code   varchar2(20),
   employee_enroll_date   date
);

CREATE TABLE student_attachment (
   student_attach_id   number      NOT NULL,
   member_id   varchar2(20)      NOT NULL,
   student_original_filename   varchar2(500),
   student_renamed_filename   varchar2(500)
);

CREATE TABLE scheduler (
   schedule_id   number      NOT NULL,
   member_id   varchar2(20)      NOT NULL,
   todo   varchar2(4000),
   schedule_created_at   date   DEFAULT sysdate,
   schedule_completed_at   date
);

CREATE TABLE vacation (
   vacation_id   number      NOT NULL,
   student_id   varchar2(20)      NOT NULL,
   teacher_id   varchar2(20)      NOT NULL,
   employee_id   varchar2(20)   ,
   vacation_send_date   date   DEFAULT sysdate,
   vacation_approve_check   char(2)
);

CREATE TABLE vacation_attachment (
   vacation_attach_id   number      NOT NULL,
   vacation_id   number      NOT NULL,
   vacation_original_filename   varchar2(500)   ,
   vacation_renamed_filename   varchar2(500)
);

CREATE TABLE board (
   board_id   number      NOT NULL,
   board_name   varchar2(30),
   board_category   varchar2(30)
);

CREATE TABLE post (
   post_id   number      NOT NULL,
   board_id   number      NOT NULL,
   member_id   varchar2(20)      NOT NULL,
   title   varchar2(400),
   post_created_at   date   DEFAULT sysdate,
   comment_check   char(1),
   post_like   number,
   attach_check   char(1),
   status_check   char(1),
   tag   varchar2(200)
);

CREATE TABLE post_content (
   post_id   number      NOT NULL,
   board_id   number      NOT NULL,
   content   varchar2(4000)
);

CREATE TABLE post_attachment (
   post_attach_id   number      NOT NULL,
   post_id   number      NOT NULL,
   board_id   number      NOT NULL,
   post_original_filename   varchar2(500),
   post_renamed_filename   varchar2(500)
);

CREATE TABLE post_comment (
   comment_id   number      NOT NULL,
   post_id   number      NOT NULL,
   board_id   number      NOT NULL,
   member_id   varchar2(20)      NOT NULL,
   comment_content   varchar2(1000),
   comment_level   number   ,
   comment_ref   number   ,
   comment_created_at   date   DEFAULT sysdate,
   comment_like   number   
);

CREATE TABLE favorite (
   board_id   number      NOT NULL,
   member_id   varchar2(20)      NOT NULL
);

CREATE TABLE message_box (
   message_id   number      NOT NULL,
   send_id   varchar2(20)      NOT NULL,
   recieve_id   varchar2(20)      NOT NULL,
   message_content   varchar2(2000),
   send_at   date   DEFAULT sysdate,
   read_check   char(1)
);

CREATE TABLE report (
   report_id   number      NOT NULL,
   post_id   number   ,
   comment_id   number   ,
   message_id   number   ,
   reporter_id   varchar2(20)      NOT NULL,
   attaker_id   varchar2(20)      NOT NULL,
   report_content   varchar2(2000),
   report_type   varchar2(20),
   report_action   varchar2(2000)
);

CREATE TABLE chat_room (
   chat_id   number      NOT NULL,
   chat_date   date   DEFAULT sysdate
);

CREATE TABLE talker (
   chat_id   number      NOT NULL,
   student_id   varchar2(20)      NOT NULL,
   employee_id   varchar2(20)      NOT NULL
);

CREATE TABLE chat_message (
   chat_no   number      NOT NULL,
   chat_id   number      NOT NULL,
   member_id   varchar2(20),
   employee_id   varchar2(20),
   chat_content   varchar2(4000),
   chat_send_at   timestamp   DEFAULT systimestamp
);

CREATE TABLE store (
   store_id   number      NOT NULL,
   store_name   varchar2(200),
   post_number   varchar2(10),
   address   varchar2(400),
   store_type   varchar2(20)
);

CREATE TABLE ticket (
   ticket_id   number      NOT NULL,
   store_id   number      NOT NULL,
   price   number   
);

CREATE TABLE ticket_order (
   order_id   number      NOT NULL,
   member_id   varchar2(20)      NOT NULL,
   store_id   number      NOT NULL,
   ticket_id   number      NOT NULL,
   amount   number      ,
   total_price   number      
);

CREATE TABLE quit_member (
   member_id   varchar2(20)      ,
   member_pwd   varchar2(300)      ,
   member_name   varchar2(10)      ,
   member_phone   varchar2(20)      ,
   memebr_email   varchar2(100)      ,
   birthday   date      ,
   member_quit_date   date   DEFAULT sysdate   
);

CREATE TABLE delete_post (
   post_id   number      ,
   board_id   number      ,
   member_id   varchar2(20)      ,
   title   varchar2(20)      ,
   post_created_at   date      ,
   comment_check   char(1)      ,
   post_like   number      ,
   attach_check   char(1)      ,
   status_check   char(1)      ,
   tag   varchar2(200)      ,
   board_category   varchar2(30)      ,
   content   varchar2(4000)      
);

CREATE TABLE delete_comment (
   comment_id   number      ,
   post_id   number      ,
   board_id   number      ,
   member_id   varchar2(20)      ,
   comment_content   varchar2(1000)      ,
   comment_level   number      ,
   comment_ref   number      ,
   comment_created_at   date      ,
   comment_like   number      
);

ALTER TABLE authority ADD CONSTRAINT PK_AUTHORITY PRIMARY KEY (
   member_id
);

ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
   member_id
);

ALTER TABLE student ADD CONSTRAINT PK_STUDENT PRIMARY KEY (
   student_id
);

ALTER TABLE class ADD CONSTRAINT PK_CLASS PRIMARY KEY (
   class_id
);

ALTER TABLE curriculum ADD CONSTRAINT PK_CURRICULUM PRIMARY KEY (
   curriculum_id
);

ALTER TABLE teacher ADD CONSTRAINT PK_TEACHER PRIMARY KEY (
   teacher_id
);

ALTER TABLE employee ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY (
   employee_id
);

ALTER TABLE student_attachment ADD CONSTRAINT PK_STUDENT_ATTACHMENT PRIMARY KEY (
   student_attach_id
);

ALTER TABLE scheduler ADD CONSTRAINT PK_SCHEDULER PRIMARY KEY (
   schedule_id
);

ALTER TABLE vacation ADD CONSTRAINT PK_VACATION PRIMARY KEY (
   vacation_id
);

ALTER TABLE vacation_attachment ADD CONSTRAINT PK_VACATION_ATTACHMENT PRIMARY KEY (
   vacation_attach_id
);

ALTER TABLE board ADD CONSTRAINT PK_BOARD PRIMARY KEY (
   board_id
);

ALTER TABLE post ADD CONSTRAINT PK_POST PRIMARY KEY (
   post_id
);

ALTER TABLE post_content ADD CONSTRAINT PK_POST_CONTENT PRIMARY KEY (
   post_id,
   board_id
);

ALTER TABLE post_attachment ADD CONSTRAINT PK_POST_ATTACHMENT PRIMARY KEY (
   post_attach_id
);

ALTER TABLE post_comment ADD CONSTRAINT PK_POST_COMMENT PRIMARY KEY (
   comment_id
);

ALTER TABLE favorite ADD CONSTRAINT PK_FAVORITE PRIMARY KEY (
   board_id,
   member_id
);

ALTER TABLE message_box ADD CONSTRAINT PK_MESSAGE_BOX PRIMARY KEY (
   message_id
);

ALTER TABLE report ADD CONSTRAINT PK_REPORT PRIMARY KEY (
   report_id
);

ALTER TABLE chat_room ADD CONSTRAINT PK_CHAT_ROOM PRIMARY KEY (
   chat_id
);

ALTER TABLE talker ADD CONSTRAINT PK_TALKER PRIMARY KEY (
   chat_id
);

ALTER TABLE chat_message ADD CONSTRAINT PK_CHAT_MESSAGE PRIMARY KEY (
   chat_no
);

ALTER TABLE store ADD CONSTRAINT PK_STORE PRIMARY KEY (
   store_id
);

ALTER TABLE ticket ADD CONSTRAINT PK_TICKET PRIMARY KEY (
   ticket_id
 
);

ALTER TABLE ticket_order ADD CONSTRAINT PK_TICKET_ORDER PRIMARY KEY (
   order_id
);

ALTER TABLE student ADD CONSTRAINT FK_member_TO_student_1 FOREIGN KEY (
   student_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE curriculum ADD CONSTRAINT FK_class_TO_curriculum_1 FOREIGN KEY (
   class_id
)
REFERENCES class (
   class_id
);

ALTER TABLE curriculum ADD CONSTRAINT FK_teacher_TO_curriculum_1 FOREIGN KEY (
   teacher_id
)
REFERENCES teacher (
   teacher_id
);

ALTER TABLE teacher ADD CONSTRAINT FK_member_TO_teacher_1 FOREIGN KEY (
   teacher_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE employee ADD CONSTRAINT FK_member_TO_employee_1 FOREIGN KEY (
   employee_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE student_attachment ADD CONSTRAINT FK_student_TO_student_attachment_1 FOREIGN KEY (
   member_id
)
REFERENCES student (
   student_id
);

ALTER TABLE scheduler ADD CONSTRAINT FK_member_TO_scheduler_1 FOREIGN KEY (
   member_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE vacation ADD CONSTRAINT FK_student_TO_vacation_1 FOREIGN KEY (
   student_id
)
REFERENCES student (
   student_id
);

ALTER TABLE student ADD CONSTRAINT FK_curriculum_TO_student_1 FOREIGN KEY (
   curriculum_id
)
REFERENCES curriculum (
   curriculum_id
);

ALTER TABLE vacation ADD CONSTRAINT FK_teacher_TO_vacation_1 FOREIGN KEY (
   teacher_id
)
REFERENCES teacher (
   teacher_id
);

ALTER TABLE vacation ADD CONSTRAINT FK_employee_TO_vacation_1 FOREIGN KEY (
   employee_id
)
REFERENCES employee (
   employee_id
);

ALTER TABLE vacation_attachment ADD CONSTRAINT FK_vacation_TO_vacation_attachment_1 FOREIGN KEY (
   vacation_id
)
REFERENCES vacation (
   vacation_id
);

ALTER TABLE post ADD CONSTRAINT FK_board_TO_post_1 FOREIGN KEY (
   board_id
)
REFERENCES board (
   board_id
);

ALTER TABLE post ADD CONSTRAINT FK_member_TO_post_1 FOREIGN KEY (
   member_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE post_content ADD CONSTRAINT FK_post_TO_post_content_1 FOREIGN KEY (
   post_id
)
REFERENCES post (
   post_id
)ON DELETE CASCADE;

ALTER TABLE post_content ADD CONSTRAINT FK_board_TO_post_content_1 FOREIGN KEY (
   board_id
)
REFERENCES board (
   board_id
);

ALTER TABLE post_attachment ADD CONSTRAINT FK_post_TO_post_attachment_1 FOREIGN KEY (
   post_id
)
REFERENCES post (
   post_id
)ON DELETE CASCADE;

ALTER TABLE post_attachment ADD CONSTRAINT FK_board_TO_post_attachment_1 FOREIGN KEY (
   board_id
)
REFERENCES board (
   board_id
);

ALTER TABLE post_comment ADD CONSTRAINT FK_post_TO_post_comment_1 FOREIGN KEY (
   post_id
)
REFERENCES post (
   post_id
)ON DELETE CASCADE;

ALTER TABLE post_comment ADD CONSTRAINT FK_board_TO_post_comment_1 FOREIGN KEY (
   board_id
)
REFERENCES board (
   board_id
);

ALTER TABLE post_comment ADD CONSTRAINT FK_member_TO_post_comment_1 FOREIGN KEY (
   member_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE favorite ADD CONSTRAINT FK_board_TO_favorite_1 FOREIGN KEY (
   board_id
)
REFERENCES board (
   board_id
);

ALTER TABLE favorite ADD CONSTRAINT FK_member_TO_favorite_1 FOREIGN KEY (
   member_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE message_box ADD CONSTRAINT FK_member_TO_message_box_1 FOREIGN KEY (
   send_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE message_box ADD CONSTRAINT FK_member_TO_message_box_2 FOREIGN KEY (
   recieve_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE report ADD CONSTRAINT FK_post_TO_report_1 FOREIGN KEY (
   post_id
)
REFERENCES post (
   post_id
)ON DELETE CASCADE;

ALTER TABLE report ADD CONSTRAINT FK_post_comment_TO_report_1 FOREIGN KEY (
   comment_id
)
REFERENCES post_comment (
   comment_id
);

ALTER TABLE report ADD CONSTRAINT FK_message_box_TO_report_1 FOREIGN KEY (
   message_id
)
REFERENCES message_box (
   message_id
);

ALTER TABLE report ADD CONSTRAINT FK_member_TO_report_1 FOREIGN KEY (
   reporter_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE report ADD CONSTRAINT FK_member_TO_report_2 FOREIGN KEY (
   attaker_id
)
REFERENCES member (
   member_id
)ON DELETE CASCADE;

ALTER TABLE talker ADD CONSTRAINT FK_chat_room_TO_talker_1 FOREIGN KEY (
   chat_id
)
REFERENCES chat_room (
   chat_id
);

ALTER TABLE talker ADD CONSTRAINT FK_student_TO_talker_1 FOREIGN KEY (
   student_id
)
REFERENCES student (
   student_id
);

ALTER TABLE talker ADD CONSTRAINT FK_employee_TO_talker_1 FOREIGN KEY (
   employee_id
)
REFERENCES employee (
   employee_id
);

ALTER TABLE chat_message ADD CONSTRAINT FK_chat_room_TO_chat_message_1 FOREIGN KEY (
   chat_id
)
REFERENCES chat_room (
   chat_id
);

ALTER TABLE chat_message ADD CONSTRAINT FK_student_TO_chat_message_1 FOREIGN KEY (
   member_id
)
REFERENCES student (
   student_id
);

ALTER TABLE chat_message ADD CONSTRAINT FK_employee_TO_chat_message_1 FOREIGN KEY (
   employee_id
)
REFERENCES employee (
   employee_id
);

ALTER TABLE ticket ADD CONSTRAINT FK_store_TO_ticket_1 FOREIGN KEY (
   store_id
)
REFERENCES store (
   store_id
);

ALTER TABLE ticket_order ADD CONSTRAINT FK_student_TO_ticket_order_1 FOREIGN KEY (
   member_id
)
REFERENCES student (
   student_id
);

ALTER TABLE ticket_order ADD CONSTRAINT FK_store_TO_ticket_order_1 FOREIGN KEY (
   store_id
)
REFERENCES store (
   store_id
);

ALTER TABLE ticket_order ADD CONSTRAINT FK_ticket_TO_ticket_order_1 FOREIGN KEY (
   ticket_id
)
REFERENCES ticket (
   ticket_id
);

--==============================================
-- check 제약조건
--==============================================
--alter table member add constraint CK_member_role check (member_role in ('e', 't', 's'));
-- e -> 직원, t는 강사, s 는 학생 (예비, 수강, 수료 모두 s)
alter table student add constraint CK_student_approve_check check (approve_check in ('y', 'n'));
-- y는 인증ok, n은 인증x
alter table student add constraint CK_student_student_type check (student_type in ('c', 's', 'p'));
-- c는예비, s 는 학생 p는 수료
alter table vacation add constraint CK_vacation_vacation_approve_check check (vacation_approve_check in ('0', '1', '2', '3'));
-- 휴가 현황 1- 제출 즉시 담당 강사에게 가는 , 2는 강사가 승인하면 직원에게 , 3은 직원이 승인한 최종승인, 0은 반려
alter table post add constraint CK_post_comment_check check (comment_check in ('y', 'n'));
-- 댓글여부
alter table post add constraint CK_post_attach_check check (attach_check in ('y', 'n'));
-- 게시글 첨부파일 유무
alter table post add constraint CK_post_status_check check (status_check in ('y', 'n'));
-- 임시저장 상태 유무
alter table message_box add constraint CK_messagebox_read_check check (read_check in ('y', 'n'));
-- 쪽지읽었는지 ?

--=================================
--트리거
--==================================
--탈퇴회원
CREATE OR REPLACE TRIGGER member_quit_trigger
AFTER DELETE ON member
FOR EACH ROW
BEGIN
    INSERT INTO quit_member (
        member_id,
        member_pwd,
        member_name,
        member_phone,
        memebr_email,
        birthday,
        member_quit_date
    )
    VALUES (
        :OLD.member_id,
        :OLD.member_pwd,
        :OLD.member_name,
        :OLD.member_phone,
        :OLD.member_email,
        :OLD.birthday,
        sysdate
    );
END;
/
--삭제게시글
CREATE OR REPLACE TRIGGER DELETE_POST_TRIGGER
BEFORE DELETE ON post
FOR EACH ROW
BEGIN
  INSERT INTO delete_post (
    post_id,
    board_id,
    member_id,
    title,
    post_created_at,
    comment_check,
    post_like,
    attach_check,
    status_check,
    tag
  ) VALUES (
    :OLD.post_id,
    :OLD.board_id,
    :OLD.member_id,
    :OLD.title,
    :OLD.post_created_at,
    :OLD.comment_check,
    :OLD.post_like,
    :OLD.attach_check,
    :OLD.status_check,
    :OLD.tag
  );
END;
/

CREATE OR REPLACE TRIGGER UPDATE_POST_TRIGGER
AFTER delete ON post_content
FOR EACH ROW
BEGIN
  update 
    delete_post
  set
    content = :OLD.content
  where
    post_id = :OLD.post_id;
  
END;
/

-- 삭제댓글 트리거
CREATE OR REPLACE TRIGGER DELETE_COMMENT_TRIGGER
AFTER delete ON post_comment
FOR EACH ROW
BEGIN
  insert into delete_comment 
  values(:OLD.comment_id, :OLD.post_id, :OLD.board_id, :OLD.member_id, :OLD.comment_content, :OLD.comment_level, :OLD.comment_ref, :OLD.comment_created_at, :OLD.comment_like);
  
END;
/
--==============================================
-- 더미데이터
--==============================================
-- member
INSERT INTO member (member_id, member_pwd, member_name, member_phone, member_email, birthday)
VALUES ('godwjd', 'godwjd', '행정팀', '010-1234-5678', 'godwjd@naver.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO member (member_id, member_pwd, member_name, member_phone, member_email, birthday)
VALUES ('chdan', 'chdan', '총무팀', '010-9234-5678', 'chdan@naver.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO member (member_id, member_pwd, member_name, member_phone, member_email, birthday)
VALUES ('dnsdud', 'dnsdud', '운영팀', '010-9234-5878', 'dnsdud@naver.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO member (member_id, member_pwd, member_name, member_phone, member_email, birthday)
VALUES ('ehdgus', 'ehdgus', '김동현', '010-9999-5678', 'ehdgus@naver.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO member (member_id, member_pwd, member_name, member_phone, member_email, birthday)
VALUES ('alfn', 'alfn', '한미루', '010-8888-5678', 'alfn@naver.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO member (member_id, member_pwd, member_name, member_phone, member_email, birthday)
VALUES ('gmlwls', 'gmlwls', '신희진', '010-8288-5678', 'gmlwls@naver.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO member (member_id, member_pwd, member_name, member_phone, member_email, birthday)
VALUES ('alsgml', 'alsgml', '정민희', '010-3888-5678', 'alsgml@naver.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO member (member_id, member_pwd, member_name, member_phone, member_email, birthday)
VALUES ('test', 'test', 'test', '010-1234-5678', 'test@naver.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));
INSERT INTO member (member_id, member_pwd, member_name, member_phone, member_email, birthday)
VALUES ('test1', 'test1', 'test1', '010-1234-5678', 'test1@naver.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));

INSERT INTO authority values('godwjd', 'ADMIN');
INSERT INTO authority values('chdan', 'ADMIN');
INSERT INTO authority values('dnsdud', 'ADMIN');
INSERT INTO authority values('ehdgus', 'TEACHER');
INSERT INTO authority values('alfn', 'STUDENT');
INSERT INTO authority values('gmlwls', 'STUDENT');
INSERT INTO authority values('alsgml', 'STUDENT');

-- class
INSERT INTO class (class_id) VALUES ('352');
INSERT INTO class (class_id) VALUES ('351');
INSERT INTO class (class_id) VALUES ('353');


-- teacher
INSERT INTO teacher (teacher_id,teacher_enroll_date)
VALUES ('ehdgus', '20/01/01');

-- curriculum
INSERT INTO curriculum  (curriculum_id, class_id, teacher_id, subject, curriculum_name,curriculum_start_at,curriculum_end_at) VALUES (seq_curriculum_id.nextval,'352','ehdgus','자바','352_JAVA_융합','22/12/31',sysdate);
INSERT INTO curriculum  (curriculum_id, class_id, teacher_id, subject, curriculum_name,curriculum_start_at,curriculum_end_at) VALUES (seq_curriculum_id.nextval,'351','ehdgus','자바','352_JAVA_융합','22/12/31',sysdate);
INSERT INTO curriculum  (curriculum_id, class_id, teacher_id, subject, curriculum_name,curriculum_start_at,curriculum_end_at) VALUES (seq_curriculum_id.nextval,'353','ehdgus','자바','352_JAVA_융합','22/12/31',sysdate);

-- student
INSERT INTO student (student_id, curriculum_id, approve_check, student_type)
VALUES ('alfn', '1', 'n', 'c');

INSERT INTO student (student_id, curriculum_id, approve_check, student_type)
VALUES ('gmlwls', '2','y', 's');

INSERT INTO student (student_id, curriculum_id, approve_check, student_type)
VALUES ('alsgml', '3', 'y', 'p');

INSERT INTO student (student_id, curriculum_id, approve_check, student_type)
VALUES ('test1', '3', 'y', 'p');

--employee
INSERT INTO employee (employee_id, job_code,employee_enroll_date) VALUES ('godwjd', '행정', '2020/02/02');
INSERT INTO employee (employee_id, job_code,employee_enroll_date) VALUES ('chdan', '총무', '2020/02/02');
INSERT INTO employee (employee_id, job_code,employee_enroll_date) VALUES ('dnsdud', '운영', '2020/02/02');
INSERT INTO employee (employee_id, job_code,employee_enroll_date) VALUES ('test', '운영', '2020/02/02');

-- scheduler
INSERT INTO scheduler (schedule_id, member_id, todo, schedule_created_at, schedule_completed_at  )
VALUES (seq_schedule_id.NEXTVAL, 'alsgml', '자바공부하기', '2023/08/01','2023/08/07');

INSERT INTO scheduler (schedule_id, member_id, todo, schedule_created_at )
VALUES (seq_schedule_id.NEXTVAL, 'alsgml', '자바공부하기', '2023/08/01');


-- vacation
INSERT INTO vacation (vacation_id, student_id, teacher_id, vacation_approve_check)
VALUES (seq_vacation_id.NEXTVAL, 'gmlwls', 'ehdgus',  '1');

INSERT INTO vacation (vacation_id, student_id, teacher_id,employee_id   , vacation_approve_check)
VALUES (seq_vacation_id.NEXTVAL, 'gmlwls', 'ehdgus',  'godwjd',2);

INSERT INTO vacation (vacation_id, student_id, teacher_id,employee_id   , vacation_approve_check)
VALUES (seq_vacation_id.NEXTVAL, 'gmlwls', 'ehdgus',  'godwjd',3);

INSERT INTO vacation (vacation_id, student_id, teacher_id,employee_id   , vacation_approve_check)
VALUES (seq_vacation_id.NEXTVAL, 'gmlwls', 'ehdgus',  'godwjd',0);

--board
INSERT INTO board (board_id, board_category, board_name) VALUES (seq_board_id.NEXTVAL, '소통', '자유게시판');

-- post
INSERT INTO post (post_id, board_id, member_id, title, comment_check,post_like, attach_check, status_check)
VALUES (seq_post_id.NEXTVAL, 1, 'gmlwls', '여긴 자유게시판?', 'n',30, 'n', 'y');

INSERT INTO post (post_id, board_id, member_id, title, comment_check,post_like, attach_check, status_check)
VALUES (seq_post_id.NEXTVAL, 1, 'gmlwls', '오점뭐먹지?', 'y',1, 'n', 'y');

INSERT INTO post (post_id, board_id, member_id, title, comment_check,post_like, attach_check, status_check)
VALUES (seq_post_id.NEXTVAL, 1, 'gmlwls', '삭제테스트?', 'n',30, 'n', 'y');
-- post_content
INSERT INTO post_content (post_id, board_id, content)
VALUES (1, 1, '자유게시판인데 왜 아무도 글을 안쓰냐 ㅡㅡ');

INSERT INTO post_content (post_id, board_id, content)
VALUES (2, 1, '배고파 ㅡㅡ');

INSERT INTO post_content (post_id, board_id, content)
VALUES (3, 1, '테스트용');

-- comment
INSERT INTO post_comment (comment_id, post_id, board_id, member_id, comment_content, comment_level, comment_ref)
VALUES (seq_comment_id.NEXTVAL, 2, 1, 'alsgml', '맥주창고만 가지말자', 1, NULL);

INSERT INTO post_comment (comment_id, post_id, board_id, member_id, comment_content, comment_level, comment_ref)
VALUES (seq_comment_id.NEXTVAL, 3, 1, 'alsgml', '삭제테스트댓글', 1, NULL);

-- favorite
INSERT INTO favorite (board_id, member_id) VALUES (1, 'gmlwls');
INSERT INTO favorite (board_id, member_id) VALUES (1, 'alsgml');

-- message_box
INSERT INTO message_box (message_id, send_id, recieve_id, message_content, read_check)
VALUES (seq_message_id.NEXTVAL, 'alfn', 'gmlwls', '언니 오늘 점심 뭐먹어?', 'n');
INSERT INTO message_box (message_id, send_id, recieve_id, message_content, read_check)
VALUES (seq_message_id.NEXTVAL, 'alfn', 'alsgml', '예비생입니다. 자바공부어떻게 해야함 ??', 'y');

-- report
INSERT INTO report (report_id, post_id, comment_id, message_id, reporter_id, attaker_id, report_content, report_type)
VALUES (seq_report_id.NEXTVAL, 1, NULL, NULL, 'alfn', 'gmlwls', '자유게시판인데 왜 이상한 글 을 올렸어요','욕설');


-- chat_room
INSERT INTO chat_room (chat_id, chat_date) VALUES (seq_chat_id.NEXTVAL, '23/08/14');

-- talker
INSERT INTO talker (chat_id, student_id, employee_id) VALUES (1, 'alfn', 'godwjd');
-- chat_message
INSERT INTO chat_message (chat_no,chat_id, member_id, chat_content) VALUES (seq_chat_message_no.nextval,1, 'alfn', '자바반 커리큐럼이 어떻게 되나요 ?');
INSERT INTO chat_message (chat_no,chat_id, employee_id  , chat_content) VALUES ( seq_chat_message_no.nextval,1, 'godwjd', '안녕하세요 ?? 자바반 등록하려고 하시나요?');

-- store
INSERT INTO store (store_id, store_name, post_number, address, store_type)
VALUES (seq_store_id.NEXTVAL, '맥주창고', '06132', '서울특별시 강남구 강남대로94길 86 2층 우편번호', '음식점');

-- ticket
INSERT INTO ticket (ticket_id, store_id, price) VALUES (seq_ticket_id.NEXTVAL, 1, 5900);

-- order
INSERT INTO ticket_order (order_id, member_id, store_id, ticket_id, amount, total_price)
VALUES (seq_order_id.NEXTVAL, 'gmlwls', 1, 1, 2, 10800);

--삭제 게시글 
delete post where post_id =3;
--삭제 댓글
delete post_comment where comment_id=2;
--삭제회원 
delete member where member_id = 'test'; 
delete member where member_id = 'test1'; 

select * from member;
select * from student;
select * from class;
select * from curriculum;
select * from teacher;
select * from employee;
select * from scheduler;
select * from vacation;
select * from board;
select * from post;
select * from post_content;
select * from post_comment;
select * from favorite;
select * from message_box;
select * from report;
select * from chat_room;
select * from talker;
select * from chat_message;
select * from store;
select * from ticket_order;
select * from quit_member;
select * from delete_post;
select * from delete_comment;
select * from authority;

SELECT p.board_id, COUNT(p.post_id) AS post_count,
       b.board_name,
       RANK() OVER (ORDER BY COUNT(p.post_id) DESC) AS post_rank
FROM post p
JOIN board b ON p.board_id = b.board_id
GROUP BY p.board_id, b.board_name
ORDER BY post_rank;