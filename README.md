# KH 정보교육원 Final Project
**Final Project 4조: 사랑해조**

## 💕프로젝트 주제
**UsTwo : 커플웹(couple-Web). 커플들을 위한 다양한 기능을 제공하는 플랫폼**

## 💑 기획 의도

현재 커플들이 사용할 수 있는 애플리케이션과 SNS는 많지만, 웹사이트 형태로 제공되는 서비스는 부족합니다. 이러한 점을 감안하여, 다양한 기능을 통합한 커플 전용 웹사이트를 개발하게 되었습니다.

기존의 어플리케이션들은 기능이 한정적이어서 사용자들이 필요로 하는 다양한 요구를 충족하지 못하고 있습니다. 저희 웹사이트는 서로의 소중한 추억을 간직하고, 관계를 더욱 돈독히 할 수 있는 다양한 기능을 제공합니다.

또한, 앱 다운로드에 꺼려하는 사용자들을 고려하여 웹 기반으로 개발하였습니다. 이를 통해 더 많은 커플들이 손쉽게 접근하고 활용할 수 있는 공간을 마련하고자 합니다.

결론적으로, 저희 웹사이트는 커플들이 함께하는 경험을 확장하고, 그들의 관계를 더욱 깊게 만들기 위해 기획되었습니다.


## 🕓 개발 기간
- 2024.09.11 ~ 2024.09.18 : 프로젝트 주제 선정
- 2024.09.19 ~ 2024.09.22 : 요구사항 분석 및 구현할 목표 설정
- 2024.09.23 ~ 2024.10.03 : 화면 설계 및 데이터 설계
- 2024.10.04 ~ 2024.10.24 : 화면 구현, 기능개발, 프로젝트 검수 및 테스트
- 2024.10.25 : 프로젝트 발표

## 🔎 개발 환경
- **OS** : Windows 10
- **Tool** : Eclipse, SQL Developer, Visual Studio Code
- **DBMS** : Oracle
- **Collaboration** : Git, SourceTree
- **WAS** : Apache Tomcat 9.0
- **Language** : Java, SQL, HTML, CSS, JavaScript, Ajax, jQeury

## 💻 기술 스택
- **Front-End** : HTML5, CSS3, JavaScript, JQuery, Ajax
- **Back-End** : Java 11, JSP & Servlet, Spring, Mybatis

## 🔑 ERD 설계
![ERD](https://github.com/user-attachments/assets/dcfa2079-3f9d-41a2-862e-9611bdfce516)

## 📋 프로젝트 설명 
📌 **프로젝트 특징**
    <br><br>
    - UsTwo는 연인들이 사용하는 웹사이트로, 개인에게 발급된 고유 코드를 통해 커플을 매칭하고, 이메일이나 카카오톡을 통해 상대방을 초대하여 함께 사이트를 만들어 나가는 플랫폼입니다. 또한, 서로의 소통을 위한 채팅 기능 및 화상채팅을 제공하며, 모바일 중심의 커플 어플리케이션을 웹으로 구현하였습니다.
    <br><br>
    - 커플 모바일 어플리케이션의 장점들을 모아 하나의 플랫폼에서 다양한 기능들을 사용할 수 있습니다.
    <br><br>

 
    

📌 **프로젝트 개선점**

📌 **프로젝트 통해 깨달은 점 및 소감**



## 🏆 팀원 구성 및 역할

- **김동규**
    - 캘린더
        - 공휴일 가져오기 (Google Calendar API)
        - 화면구현 (FullCalendar JS Library)
        - 일정알림 문자보내기 (Twilio API)
        - 일정, 캘린더 CRUD
    - 마인드맵
        - 화면구현 (Go JS Library)
        - 마인드맵 CRUD
    - 마이페이지
        - 초대코드 카카오톡 공유 (Kakao API)
        - 탈퇴 30일 후 계정영구삭제 (DBMS Scheduler을 통한 자동화)
        - 회원 조회/변경/삭제, 커플 등록/삭제
    - 홈
        - 만난지 몇일 D-DAY 카운트
        - 커플 정보 조회/변경
        - 로그인 전/후 홈페이지 화면구현

- **이승헌**
    - 회원가입
        - 이메일 인증 (Gmail API)
        - 주소검색 (kakao 주소검색 API)
    - 로그인
        - 아이디 찾기
        - 비밀번호 변경
    - 1대 1 채팅
        - Websocket을 이용한 1대 1 text 채팅
        - WebRTC를 이용한 영상통화
   
- **이은지**

- **황영찬**
    - 앨범
        - 구글 포토에 등록된 앨범 가져오기 (Google PhotosLibrary API)
        - 앨범 생성, 사진 추가/삭제하기 (Google PhotosLibrary API)
        - 스토리(사진 게시판) 생성 및 댓글 기능 
        - 댓글 좋아요 기능
    - 활동 추천
        - 인기 영화 추천 목록 (TMDB API)
        - 인기 TV프로그램 추천 목록 (TMDB API)
        - 카테고리 별 목록 변경
        - 영화 및 TV 프로그램 상세 정보 조회
        - 랜덤 활동 추천
    - 관리자 페이지
        - 전체 회원 정보 조회
## 👊프로젝트 구현

### ❤ 김동규

#### 🔴 캘린더

##### 캘린더 - 조회

> - 공휴일 가져오기 (Google Calendar API). // 빨간색 일정이 공휴일.
> - 화면구현 (FullCalendar JS Library)
> - 년/월/주/일/목록별 조회

![Calendar_view](https://github.com/user-attachments/assets/e849d7ff-b347-4041-a4bd-7040b351468d)


##### 캘린더 - 알림 문자발신

> - Twilio API 사용

![Calendar_textAlert](https://github.com/user-attachments/assets/fe35bb2f-f878-4b1e-803a-309f88cecd92)

> 핸드폰 받은문자메시지

<img src="https://github.com/user-attachments/assets/a96ede5b-c8be-4d8f-a28b-1783c4f5a0c8" alt="sms message" width="400px">
<!-- ![Calendar_textAlert_result](https://github.com/user-attachments/assets/a96ede5b-c8be-4d8f-a28b-1783c4f5a0c8) -->


##### 캘린더 - 일정 CRUD

> - 월/주/일/년별 View에서 일정 추가
> - 일정 수정/삭제

![Calendar_CRUD](https://github.com/user-attachments/assets/5d2d5ca4-1b74-4b9e-a4a7-0317cbd26f37)


##### 캘린더 - 캘린더별 조회/수정

> - 모든일정 / 우리일정 / 내일정 / 상대방일정별 조회
> - 캘린더별 기본색상 변경

![Calendar_Cal ReadUpdate](https://github.com/user-attachments/assets/d101eed8-887f-48d6-86bf-565558dd8bc7)


#### 🔴 마인드맵


#### 🔴 마이페이지


#### 🔴 홈 

##### 홈 - 커플정보 수정

> - 만난지 몇일 D-DAY 카운트 기능 포함

![memberHome_edit](https://github.com/user-attachments/assets/13611d1f-c504-475c-a37a-ddfb039e5f91)

##### 홈 - 로그인 전/후 화면구현

> 로그인 전

![guestHome](https://github.com/user-attachments/assets/9bd048f1-e3c6-4067-902f-3a4ca8d6bc18)

> 로그인 후

![memberHome](https://github.com/user-attachments/assets/4a5d9caf-3682-4be0-aeb6-e479db097fc9)


### 🧡 이승헌

#### 🟠 로그인/회원가입

##### 회원가입

> 회원가입시 이메일 인증
> 주소 검색을 위한 kakaoAPI 이용

![회원가입 7mb](https://github.com/user-attachments/assets/c39e481a-6cd3-4466-b823-e341ea4206b2)


##### 로그인 기능

> (커플코드 없는 사람의 로그인)

![커플코드없는사람 마이페이지](https://github.com/user-attachments/assets/e221204c-4007-4df2-89eb-0db56026b425)

> (커플코드 있는 사람의 로그인)

![커플코드있는아이디 로그인](https://github.com/user-attachments/assets/f9a61c47-9985-4888-8972-13cfd08887ef)


##### 아이디 찾기
![아이디 찾기](https://github.com/user-attachments/assets/3301ad98-e8c9-4a04-8f5b-c06c965b402a)


##### 비밀번호 찾기

![비밀번호 찾기 및 변경](https://github.com/user-attachments/assets/02d3cd40-68ce-417c-971f-4f573a20c3ba)


#### 🟠 1대 1 채팅

![채팅기능](https://github.com/user-attachments/assets/8e48e5f1-cdd0-474c-a3c3-43f22f0ceac5)
 
#### 🟠 1 대 1 화상통화

![화상통화 다시만듬](https://github.com/user-attachments/assets/2b804ecb-7062-47fc-93a3-675d3b1e6a6b)


### 💛 이은지
#### 🟡 메뉴명
#### 🟡 메뉴명
#### 🟡 메뉴명

### 💚 황영찬
#### 🟢 앨범
##### 앨범 - 조회
> - 앨범 가져오기 (Google PhotosLibrary API)

![앨범 가져오기](https://github.com/user-attachments/assets/bf8d6946-e130-4d0a-a931-decf2fbd0b44)

##### 앨범 - 추가 및 삭제

> - 앨범 만들기 

![앨범 만들기](https://github.com/user-attachments/assets/a666d659-becc-40bd-a2f5-d133b0879fab)

> - 앨범 사진 추가

![앨범 사진 추가하기](https://github.com/user-attachments/assets/946a00cf-9dec-49f4-8b6d-b8a397be2aa7)

> - 앨범 사진 삭제

![앨범 사진 삭제하기](https://github.com/user-attachments/assets/0ac862ef-8bd6-4a37-9f82-080d912fef44)

#### 🟢 스토리
##### 스토리 - 게시
> - 스토리 조회
> - 스토리 새로 등록

![스토리 게시하기](https://github.com/user-attachments/assets/e236b92c-22b2-4aac-9386-eed750977413)

> - 스토리 댓글 작성

![스토리 댓글 작성하기](https://github.com/user-attachments/assets/b01265e7-f2af-4cd7-9bbf-f8565752cf4d)

> - 스토리 댓글 좋아요
> - 스토리 삭제

![스토리 댓글 좋아요 및 삭제](https://github.com/user-attachments/assets/612d5eac-f585-40c0-bca3-723072ca3c6c)

#### 🟢 활동 추천
##### 활동 추천 - 조회

> - 인기 영화 및 TV프로그램 조회
> - 카테고리 별 새로운 리스트업

![영화 조회](https://github.com/user-attachments/assets/03f7fa88-dcae-4991-a8cb-54af97181506)

> - 영화 및 TV 프로그램 상세정보

![영화 상세조회](https://github.com/user-attachments/assets/2b191062-d6b1-4bf8-a6b9-cf183f0a89e0)

##### 활동 추천 - 랜덤 추천
> - 랜덤으로 활동 추천

![랜덤 활동 추천](https://github.com/user-attachments/assets/de1cd766-1870-4e61-9bef-a7e1d04b6658)

#### 🟢 관리자 페이지
##### 관리자 페이지 - 조회
> - 전체 회원 조회

 ![관리자 페이지](https://github.com/user-attachments/assets/7b1da6f6-b4ff-4efc-9a3e-ad2a8154405b)

## 스크립트

<details>
    <summary>스트립트.sql</summary>
    <pre>
    -- 파이널프로젝트 4조 DB스크립트

--------------------------------------------------
--------------  기존 데이터 삭제   ------------------	
--------------------------------------------------

--접속유저의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--접속유저의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

-- 계정영구삭제용 job 삭제 - 추가함 by 동규 (2024.10.15)
BEGIN
    DBMS_SCHEDULER.drop_job(
        job_name => 'DELETE_INACTIVE_MEMBERS_JOB',
        force    => TRUE  -- Use TRUE to forcefully drop the job if it's running
    );
END;
/

-- 탈퇴신청 30일 후 계정영구삭제, 안쓰는 커플코드 영구삭제. 매일 밤 12시에 실행됨 - 추가함 by 동규 (2024.10.15)
BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'DELETE_INACTIVE_MEMBERS_JOB',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN
                                DELETE FROM C_MEMBER
                                WHERE status = ''N''
                                  AND modify_date <= SYSDATE - 30;

                                DELETE FROM C_COUPLE
                                WHERE couple_code IN (
                                    SELECT cc.couple_code
                                    FROM C_COUPLE cc
                                    LEFT JOIN C_MEMBER cm ON cc.couple_code = cm.couple_code
                                    WHERE cm.couple_code IS NULL
                                );
                            END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval  => 'FREQ=DAILY; BYHOUR=0; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE
    );
END;
/
/*
<계정영구삭제 날짜 관련 예시> by 동규 (2024.10.23)
0. 탈퇴신청 : 9/15

1. 현재날짜 10/16 - 30일 = 9/16
9/15 <= 9/16 --> true 삭제

2. 현재날짜 10/15 - 30일 = 9/15
9/15 <= 9/15 --> true 삭제

3. 현재날짜 10/14 - 30일 = 9/14
9/15 <= 9/14 --> false 삭제안됨
*/

--------------------------------------------------
--------------       커플	     ------------------	
--------------------------------------------------
CREATE TABLE C_COUPLE(
    COUPLE_CODE VARCHAR2(15) PRIMARY KEY,
    START_DATE DATE,
    ORIGIN_NAME VARCHAR2(100),
    CHANGE_NAME VARCHAR2(100),
    SENTENCE VARCHAR2(100),
    STATUS CHAR(1) DEFAULT'Y' NOT NULL,
    CHECK(STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN C_COUPLE.COUPLE_CODE IS '커플코드';
COMMENT ON COLUMN C_COUPLE.START_DATE IS '만남시작일자';
-- 헤어진날짜는 필요없어서 삭제함 by 동규 (2024.10.18)
COMMENT ON COLUMN C_COUPLE.ORIGIN_NAME IS '배경사진원래이름(기존파일명)';
COMMENT ON COLUMN C_COUPLE.CHANGE_NAME IS '배경사진변경이름(저장경로+새파일명)';
COMMENT ON COLUMN C_COUPLE.SENTENCE IS '커플홈문장';
COMMENT ON COLUMN C_COUPLE.STATUS IS '상태(Y:교제중, N:헤어짐)';

INSERT INTO C_COUPLE VALUES('admin', NULL, NULL, NULL, NULL, 'Y');
INSERT INTO C_COUPLE VALUES('DFGDFG5623SAD12', TO_DATE('2018-07-07', 'YYYY-MM-DD'),'Eugene_Aesin.jpg', 'resources/uploadFiles/Eugene_Aesin.jpg', '"합시다, 러브. 나랑, 나랑 같이."', 'Y');
INSERT INTO C_COUPLE VALUES('A1B2C3D4E5F6G7H', NULL, NULL, NULL, NULL, 'N');


--------------------------------------------------
--------------       회원	    ------------------	
--------------------------------------------------
CREATE TABLE C_MEMBER(
    EMAIL VARCHAR2(100) PRIMARY KEY,
    USER_PWD VARCHAR2(100) NOT NULL,
    USER_NAME VARCHAR2(50) NOT NULL,
    NICKNAME VARCHAR2(100),
    GENDER VARCHAR2(1),
    PHONE VARCHAR2(16),
    ADDRESS VARCHAR2(300),
    BRITHDAY DATE,
    ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
    MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL,
    INVITE_CODE VARCHAR2(10) UNIQUE,
    COUPLE_CODE VARCHAR2(15),
    PARTNER_EMAIL VARCHAR2(100),
    ORIGIN_NAME VARCHAR2(100),
    CHANGE_NAME VARCHAR2(100),
    STATUS VARCHAR2(1) DEFAULT 'W' NOT NULL,
    FOREIGN KEY(COUPLE_CODE) REFERENCES C_COUPLE(COUPLE_CODE),
    CHECK(GENDER IN ('M', 'F')),
    CHECK(STATUS IN ('W', 'Y', 'N'))
);

COMMENT ON COLUMN C_MEMBER.EMAIL IS '이메일. 이메일로 유저구분 (별도 아이디 없음)';
COMMENT ON COLUMN C_MEMBER.USER_PWD IS '비밀번호';
COMMENT ON COLUMN C_MEMBER.USER_NAME IS '이름';
COMMENT ON COLUMN C_MEMBER.NICKNAME IS '닉네임. 본인/상대방 닉네임 수정가능';
COMMENT ON COLUMN C_MEMBER.GENDER IS '성별(M/F)';
COMMENT ON COLUMN C_MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN C_MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN C_MEMBER.BRITHDAY IS '생년월일';
COMMENT ON COLUMN C_MEMBER.ENROLL_DATE IS '회원가입날짜';
COMMENT ON COLUMN C_MEMBER.MODIFY_DATE IS '회원수정날짜';
COMMENT ON COLUMN C_MEMBER.INVITE_CODE IS '초대코드(UNIQUE. 랜덤생성코드)';
COMMENT ON COLUMN C_MEMBER.COUPLE_CODE IS '커플코드(커플게시글 조회시 사용)';
COMMENT ON COLUMN C_MEMBER.PARTNER_EMAIL IS '상대방이메일';
COMMENT ON COLUMN C_MEMBER.ORIGIN_NAME IS '프로필원본명';
COMMENT ON COLUMN C_MEMBER.CHANGE_NAME IS '프로필수정명';
COMMENT ON COLUMN C_MEMBER.STATUS IS '상태(W/Y: 커플등록전/후, 탈퇴대기:N)';


INSERT INTO C_MEMBER VALUES('admin@email.com', 'admin', '관리자', '리자', 'M', '01044858855', '서울 강서구', TO_DATE('1995-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'admin', 'admin', NULL, NULL, NULL, 'Y');
INSERT INTO C_MEMBER VALUES('user01@email.com', 'pass01', '유진초이', '유진', 'M', '01055556666', '서울 강서구', TO_DATE('1995-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'CCCCC11111', 'DFGDFG5623SAD12', 'user02@email.com', 'Eugene.jpg', 'resources/uploadFiles/Eugene.jpg', 'Y');
INSERT INTO C_MEMBER VALUES('user02@email.com', 'pass02', '고애신', '애신', 'F', '01066667777', '서울 강서구', TO_DATE('1997-01-20', 'YYYY-MM-DD'), TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'DDDDD22222', 'DFGDFG5623SAD12', 'user01@email.com', 'Aesin.jpg', 'resources/uploadFiles/Aesin.jpg', 'Y');
INSERT INTO C_MEMBER VALUES('user03@email.com', 'pass03', '마동석', '동석', 'M', '01022223333', '서울 강남구 삼성동', TO_DATE('1988-07-04', 'YYYY-MM-DD'), TO_DATE('2024-07-23', 'YYYY-MM-DD'), TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'A1B2C3D4E5', 'A1B2C3D4E5F6G7H', 'user04@email.com', NULL, NULL, 'N');
INSERT INTO C_MEMBER VALUES('user04@email.com', 'pass04', '장이수', '이수', 'F', '01033334444', '서울 강남구 대치동', TO_DATE('1989-05-05', 'YYYY-MM-DD'), TO_DATE('2024-07-24', 'YYYY-MM-DD'), TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'F6G7H8I9J1', 'A1B2C3D4E5F6G7H', 'user03@email.com', NULL, NULL, 'N');
INSERT INTO C_MEMBER VALUES('user05@email.com', 'pass05', '차은우', '은우', 'M', '01011112222', '서울 강남구 역삼동', TO_DATE('1999-12-25', 'YYYY-MM-DD'), TO_DATE('2024-07-30', 'YYYY-MM-DD'), TO_DATE('2024-08-27', 'YYYY-MM-DD'), 'GR32A1345D', NULL, NULL, NULL, NULL, 'W');
INSERT INTO C_MEMBER VALUES('user06@email.com', 'pass06', '장원영', '원영', 'F', NULL, NULL, TO_DATE('2000-08-08', 'YYYY-MM-DD'), TO_DATE('2024-10-10', 'YYYY-MM-DD'), TO_DATE('2024-10-10', 'YYYY-MM-DD'), NULL, NULL, NULL, NULL, NULL, 'W');

--------------------------------------------------
--------------     텍스트대치 	------------------	
--------------------------------------------------
CREATE TABLE T_TEXTCONFRON(
    TEXT_NUM NUMBER PRIMARY KEY,
    EMAIL VARCHAR2(100) NOT NULL,
    TRANS_TEXT VARCHAR2(300),
    ORIGIN_TEXT VARCHAR2(300),
    FOREIGN KEY (EMAIL) REFERENCES C_MEMBER(EMAIL)
);

CREATE SEQUENCE TEXT_SQE;

--------------------------------------------------
--------------       채팅방   	------------------	
--------------------------------------------------
CREATE TABLE T_CHATROOM(
    CHTR_NUM VARCHAR2(2000) PRIMARY KEY,
    EMAIL1 VARCHAR2(100) NOT NULL,
    EMAIL2 VARCHAR2(100) NOT NULL,
    FOREIGN KEY(EMAIL1) REFERENCES C_MEMBER (EMAIL),
    FOREIGN KEY(EMAIL2) REFERENCES C_MEMBER (EMAIL)
);

--------------------------------------------------
--------------      채팅 내용	    ------------------	
--------------------------------------------------
CREATE TABLE T_CHATTING(
    CHATTING_NUM NUMBER PRIMARY KEY,
    MY_CHAT VARCHAR2(1000),
    EMAIL VARCHAR2(100) NOT NULL,
    CHAT_STATUS VARCHAR2(1) DEFAULT 'Y' NOT NULL,
    CHAT_ROOM_NO VARCHAR2(2000),
    COUPLE_CODE VARCHAR2(20) NOT NULL,
    FOREIGN KEY(EMAIL) REFERENCES C_MEMBER(EMAIL),
    FOREIGN KEY(CHAT_ROOM_NO) REFERENCES T_CHATROOM(CHTR_NUM),
    FOREIGN KEY(COUPLE_CODE) REFERENCES C_COUPLE(COUPLE_CODE)
);

CREATE SEQUENCE CHAT_SQE;

--------------------------------------------------
--------------     캘린더    ------------------	
--------------------------------------------------
CREATE TABLE P_CALENDAR(
    CALENDAR_NO NUMBER PRIMARY KEY,
    COUPLE_CODE VARCHAR2(15) NOT NULL,
    OWNER VARCHAR2(100) NOT NULL,
    DEFAULT_COLOR VARCHAR2(20) NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' NOT NULL,
    FOREIGN KEY(COUPLE_CODE) REFERENCES C_COUPLE(COUPLE_CODE) ON DELETE CASCADE,
    CHECK(STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN P_CALENDAR.CALENDAR_NO IS '캘린더번호';
COMMENT ON COLUMN P_CALENDAR.COUPLE_CODE IS '커플코드';
COMMENT ON COLUMN P_CALENDAR.OWNER IS '소유자(BOTH: 커플둘다, 이메일: 커플중한명)';
COMMENT ON COLUMN P_CALENDAR.DEFAULT_COLOR IS '기본색상';
COMMENT ON COLUMN P_CALENDAR.STATUS IS '상태(삭제전:Y, 삭제후:N)';

CREATE SEQUENCE SEQ_CALENDAR_NO
NOCACHE;

INSERT INTO P_CALENDAR VALUES(SEQ_CALENDAR_NO.NEXTVAL, 'DFGDFG5623SAD12', 'BOTH', '#ec9aec', 'Y'); -- 우리일정 : 핑크
INSERT INTO P_CALENDAR VALUES(SEQ_CALENDAR_NO.NEXTVAL, 'DFGDFG5623SAD12', 'user01@email.com', '#3788d8', 'Y'); -- 내일정 : 파랑
INSERT INTO P_CALENDAR VALUES(SEQ_CALENDAR_NO.NEXTVAL, 'DFGDFG5623SAD12', 'user02@email.com', '#27ae60', 'Y'); -- 상대방일정 : 초록


--------------------------------------------------
--------------     일정    ------------------	
--------------------------------------------------
CREATE TABLE P_SCHEDULE(
    SCHEDULE_NO NUMBER PRIMARY KEY,
    CALENDAR_NO NUMBER NOT NULL,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(500),
    START_DATE DATE NOT NULL,
    START_TIME DATE,
    END_DATE DATE,
    END_TIME DATE,
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    ALERT_DATE DATE,
    COLOR VARCHAR2(20),
    WRITER VARCHAR2(100) NOT NULL,
    STATUS CHAR(1) DEFAULT 'Y' NOT NULL,
    FOREIGN KEY(CALENDAR_NO) REFERENCES P_CALENDAR(CALENDAR_NO),
    FOREIGN KEY(WRITER) REFERENCES C_MEMBER(EMAIL) ON DELETE CASCADE,
    CHECK(STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN P_SCHEDULE.SCHEDULE_NO IS '일정번호';
COMMENT ON COLUMN P_SCHEDULE.CALENDAR_NO IS '캘린더번호';
COMMENT ON COLUMN P_SCHEDULE.TITLE IS '제목';
COMMENT ON COLUMN P_SCHEDULE.CONTENT IS '내용';
COMMENT ON COLUMN P_SCHEDULE.START_DATE IS '시작일';
COMMENT ON COLUMN P_SCHEDULE.START_TIME IS '시작시간';
COMMENT ON COLUMN P_SCHEDULE.END_DATE IS '종료일';
COMMENT ON COLUMN P_SCHEDULE.END_TIME IS '종료시간';
COMMENT ON COLUMN P_SCHEDULE.CREATE_DATE IS '생성일';
COMMENT ON COLUMN P_SCHEDULE.ALERT_DATE IS '알림일(해당 일시에 알림문자 전송)';
COMMENT ON COLUMN P_SCHEDULE.COLOR IS '색상(값 없으면 캘린더 기본색상사용)';
COMMENT ON COLUMN P_SCHEDULE.WRITER IS '작성자이메일';
COMMENT ON COLUMN P_SCHEDULE.STATUS IS '상태(삭제전:Y, 삭제후:N)';

CREATE SEQUENCE SEQ_SCHEDULE_NO
NOCACHE;

INSERT 
  INTO P_SCHEDULE
VALUES
     (
       SEQ_SCHEDULE_NO.NEXTVAL
     , 1
     , '국내 여행'
     , '어디로 갈진 정해야함!!'
     , TO_DATE('2024-10-19', 'YYYY-MM-DD')
     , NULL
     , TO_DATE('2024-10-21', 'YYYY-MM-DD')
     , NULL
     , TO_DATE('2024-10-01', 'YYYY-MM-DD')
     , NULL
     , NULL
     , 'user01@email.com'
     , 'Y'
     );
     
INSERT 
  INTO P_SCHEDULE
VALUES
     (
       SEQ_SCHEDULE_NO.NEXTVAL
     , 2
     , '한국어 시험'
     , NULL
     , TO_DATE('2024-10-21', 'YYYY-MM-DD')
     , TO_TIMESTAMP('09:00:00', 'HH24:MI:SS')
     , TO_DATE('2024-10-21', 'YYYY-MM-DD')
     , TO_TIMESTAMP('12:00:00', 'HH24:MI:SS')
     , TO_DATE('2024-10-01', 'YYYY-MM-DD')
     , NULL
     , NULL
     , 'user01@email.com'
     , 'Y'
     );

INSERT 
  INTO P_SCHEDULE
VALUES
     (
       SEQ_SCHEDULE_NO.NEXTVAL
     , 3
     , '제주도 가족여행'
     , NULL
     , TO_DATE('2024-10-25', 'YYYY-MM-DD')
     , NULL
     , TO_DATE('2024-10-29', 'YYYY-MM-DD')
     , NULL
     , TO_DATE('2024-10-03', 'YYYY-MM-DD')
     , NULL
     , NULL
     , 'user02@email.com'
     , 'Y'
     );

INSERT 
  INTO P_SCHEDULE
VALUES
     (
       SEQ_SCHEDULE_NO.NEXTVAL
     , 2
     , '업무출장'
     , NULL
     , TO_DATE('2024-10-23', 'YYYY-MM-DD')
     , NULL
     , NULL
     , NULL
     , TO_DATE('2024-10-10', 'YYYY-MM-DD')
     , NULL
     , NULL
     , 'user01@email.com'
     , 'Y'
     );

--------------------------------------------------
--------------     마인드맵    ------------------	
--------------------------------------------------
CREATE TABLE P_MINDMAP(
    MINDMAP_NO NUMBER PRIMARY KEY,
    KEY NUMBER NOT NULL,
    PARENT NUMBER,
    TEXT VARCHAR2(100),
    BRUSH VARCHAR2(20),
    DIR VARCHAR2(10),
    LOC VARCHAR2(50),
    COUPLE_CODE VARCHAR2(15) NOT NULL,
    FOREIGN KEY(COUPLE_CODE) REFERENCES C_COUPLE(COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN P_MINDMAP.MINDMAP_NO IS '마인드맵번호';
COMMENT ON COLUMN P_MINDMAP.KEY IS '키';
COMMENT ON COLUMN P_MINDMAP.PARENT IS '부모키';
COMMENT ON COLUMN P_MINDMAP.TEXT IS '내용';
COMMENT ON COLUMN P_MINDMAP.BRUSH IS '색상';
COMMENT ON COLUMN P_MINDMAP.DIR IS '방향';
COMMENT ON COLUMN P_MINDMAP.LOC IS '위치';
COMMENT ON COLUMN P_MINDMAP.COUPLE_CODE IS '커플코드';

CREATE SEQUENCE SEQ_MINDMAP_NO
NOCACHE;

INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 0, NULL, '커플마인드맵', NULL, NULL, '0 0', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 1, 0, '하고싶은것', 'skyblue', 'right', '193.078125 -136', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 11, 1, '번지점프', 'skyblue', 'right', '349.078125 -214', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 12, 1, '스카이다이빙', 'skyblue', 'right', '343.078125 -162', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 13, 1, '스쿠버다이빙', 'skyblue', 'right', '342.078125 -101', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 2, 0, '필요한것', 'darkseagreen', 'right', '175.078125 125', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 21, 2, '나', 'darkseagreen', 'right', '315.078125 75.5', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 211, 21, '면접용 정장', 'darkseagreen', 'right', '365.078125 49.5', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 212, 21, '수영복', 'darkseagreen', 'right', '365.078125 75.5', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 22, 2, '상대방', 'darkseagreen', 'right', '317.078125 195.5', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 3, 0, '가고싶은곳', 'palevioletred', 'left', '-145 -133.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 31, 3, '해외', 'palevioletred', 'left', '-245 -186.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 32, 3, '국내', 'palevioletred', 'left', '-258 -37.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 331, 31, '이탈리아', 'palevioletred', 'left', '-295 -212.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 332, 31, '스페인', 'palevioletred', 'left', '-295 -186.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 4, 0, '보고싶은것', 'coral', 'left', '-127 175.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 41, 4, '영화', 'coral', 'left', '-212 130.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, 42, 4, '드라마', 'coral', 'left', '-212 195.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -20, 31, '프랑스', 'palevioletred', 'left', '-295 -160.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -21, 32, '제주도', 'palevioletred', 'left', '-308 -63.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -22, 32, '부산', 'palevioletred', 'left', '-308 -37.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -23, 32, '강릉', 'palevioletred', 'left', '-308 -11.75', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -24, 41, '버킷리스트', 'coral', 'left', '-262 117.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -25, 41, '행복을 찾아서', 'coral', 'left', '-262 143.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -27, 42, '미스터 션샤인', 'coral', 'left', '-271 169.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -28, 42, '기묘한 이야기', 'coral', 'left', '-271 195.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -29, 42, '워킹데드', 'coral', 'left', '-271 221.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -30, 4, '예능', 'coral', 'left', '-219 287.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -31, -30, '흑백요리사', 'coral', 'left', '-269 274.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -32, -30, '유퀴즈', 'coral', 'left', '-269 300.25', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -33, 21, '데스크탑 컴퓨터', 'darkseagreen', 'right', '365.078125 101.5', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -34, 22, '핸드폰 케이스', 'darkseagreen', 'right', '376.078125 169.5', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -35, 22, '가방', 'darkseagreen', 'right', '385.078125 207.5', 'DFGDFG5623SAD12');
INSERT INTO P_MINDMAP VALUES(SEQ_MINDMAP_NO.NEXTVAL, -36, 22, '여행용 캐리어', 'darkseagreen', 'right', '378.078125 249.5', 'DFGDFG5623SAD12');

--------------------------------------------------
--------------     연애 고사    ------------------   
--------------------------------------------------
CREATE TABLE F_TEST(
    TEST_NO NUMBER PRIMARY KEY,
    TEST_SCORE NUMBER NOT NULL,
    TEST_DATE DATE DEFAULT SYSDATE NOT NULL,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_TEST.TEST_NO IS '연애 고사 번호';
COMMENT ON COLUMN F_TEST.TEST_SCORE IS '연애 고사 점수';
COMMENT ON COLUMN F_TEST.TEST_DATE IS '연애 고사 응시일';
COMMENT ON COLUMN F_TEST.EMAIL IS '이메일';
COMMENT ON COLUMN F_TEST.COUPLE_CODE IS '커플코드';

CREATE SEQUENCE SEQ_TEST_NO
NOCACHE;

INSERT INTO F_TEST VALUES(SEQ_TEST_NO.NEXTVAL, 90, SYSDATE, 'user01@email.com', 'DFGDFG5623SAD12');


--------------------------------------------------
--------------     연애 고사 질문    ------------------   
--------------------------------------------------
CREATE TABLE F_QTEST(
    QTEST_NO NUMBER PRIMARY KEY,
    QTEST_CONTENT VARCHAR2(300) NOT NULL,
    TEST_NO NUMBER NOT NULL REFERENCES F_TEST (TEST_NO) ON DELETE CASCADE,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_QTEST.QTEST_NO IS '질문 번호';
COMMENT ON COLUMN F_QTEST.QTEST_CONTENT IS '질문 내용';
COMMENT ON COLUMN F_QTEST.TEST_NO IS '연애 고사 번호';
COMMENT ON COLUMN F_QTEST.EMAIL IS '이메일';
COMMENT ON COLUMN F_QTEST.COUPLE_CODE IS '커플코드';

CREATE SEQUENCE SEQ_QTEST_NO
NOCACHE;

INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'처음 만난 곳을 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'첫 데이트 장소를 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'100일 날짜를 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'가장 처음 받은 선물을 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'상대방이 가장 좋아하는 애정 표현을 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'상대방이 가장 좋아하는 색을 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'상대방이 가장 좋아하는 음식을 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'상대방이 가장 자주하는 말을 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'상대방의 첫번째 버킷리스트를 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QTEST VALUES(SEQ_QTEST_NO.NEXTVAL,'상대방의 혈액형을 고르시오.', 1, 'user01@email.com', 'DFGDFG5623SAD12');

--------------------------------------------------
--------------     연애 고사 보기    ------------------   
--------------------------------------------------
CREATE TABLE F_OPTION_TEST (
    OPTION_NO NUMBER PRIMARY KEY,
    OPTION_CONTENT VARCHAR2(300) NOT NULL,
    OPTION_TRUE CHAR(1) DEFAULT 'N' CHECK (OPTION_TRUE IN ('Y', 'N')) NOT NULL,
    QTEST_NO NUMBER NOT NULL REFERENCES F_QTEST (QTEST_NO) ON DELETE CASCADE,
    TEST_NO NUMBER NOT NULL REFERENCES F_TEST (TEST_NO) ON DELETE CASCADE,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_OPTION_TEST.OPTION_NO IS '보기 번호';
COMMENT ON COLUMN F_OPTION_TEST.OPTION_CONTENT IS '보기 내용';
COMMENT ON COLUMN F_OPTION_TEST.OPTION_TRUE IS '정답 여부';
COMMENT ON COLUMN F_OPTION_TEST.QTEST_NO IS '질문 번호';
COMMENT ON COLUMN F_OPTION_TEST.TEST_NO IS '연애 고사 번호';
COMMENT ON COLUMN F_OPTION_TEST.EMAIL IS '이메일';
COMMENT ON COLUMN F_OPTION_TEST.COUPLE_CODE IS '커플 코드';

CREATE SEQUENCE SEQ_OPTION_NO
NOCACHE;

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '불란서 제빵소', 'N', 1, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '글로리호텔', 'N', 1, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '평양시가지', 'Y', 1, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '조선총독부', 'N', 1, 1, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '파주', 'N', 2, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '논산', 'Y', 2, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '평양', 'N', 2, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '부산', 'N', 2, 1, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '1905-08-18', 'Y', 3, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '1906-08-18', 'N', 3, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '1905-12-15', 'N', 3, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '1906-02-15', 'N', 3, 1, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '총', 'N', 4, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '칼', 'N', 4, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '비녀', 'N', 4, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '약과', 'Y', 4, 1, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '러브합시다', 'Y', 5, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '죽여버려', 'N', 5, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '내 아임다', 'N', 5, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '도망가', 'N', 5, 1, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '빨강색', 'N', 6, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '파란색', 'Y', 6, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '검정색', 'N', 6, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '흰색', 'N', 6, 1, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '떡볶이', 'N', 7, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '불고기', 'N', 7, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '비빔밥', 'Y', 7, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '크루와상', 'N', 7, 1, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '유진', 'N', 8, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '싫어', 'N', 8, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '좋아', 'Y', 8, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '뭐할까?', 'N', 8, 1, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '스쿠버다이빙', 'N', 9, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '불란서 제빵소 인수', 'N', 9, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '하루 종일 누워있기', 'N', 9, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, '대한 독립', 'Y', 9, 1, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, 'A', 'N', 10, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, 'B', 'N', 10, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, 'AB', 'N', 10, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_OPTION_TEST VALUES(SEQ_OPTION_NO.NEXTVAL, 'O', 'Y', 10, 1, 'user01@email.com', 'DFGDFG5623SAD12');

--------------------------------------------------
--------------     연애 고사 답변    ------------------   
--------------------------------------------------
CREATE TABLE F_ATEST (
    ATEST_NO NUMBER PRIMARY KEY,
    ATEST_CONTENT VARCHAR2(300) NOT NULL,
    ATEST_TRUE CHAR(1) CHECK (ATEST_TRUE IN ('Y', 'N')) NOT NULL,
    QTEST_NO NUMBER NOT NULL REFERENCES F_QTEST (QTEST_NO) ON DELETE CASCADE,
    TEST_NO NUMBER NOT NULL REFERENCES F_TEST (TEST_NO) ON DELETE CASCADE,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_ATEST.ATEST_NO IS '답변 번호';
COMMENT ON COLUMN F_ATEST.ATEST_CONTENT IS '답변 내용';
COMMENT ON COLUMN F_ATEST.ATEST_TRUE IS '정답 여부';
COMMENT ON COLUMN F_ATEST.QTEST_NO IS '질문 번호';
COMMENT ON COLUMN F_ATEST.TEST_NO IS '연애 고사 번호';
COMMENT ON COLUMN F_ATEST.EMAIL IS '이메일';
COMMENT ON COLUMN F_ATEST.COUPLE_CODE IS '커플 코드';

CREATE SEQUENCE SEQ_ATEST_NO
NOCACHE;

INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, '평양시가지', 'Y', 1, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, '논산', 'Y', 2, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, '1905-08-18', 'Y', 3, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, '약과', 'Y', 4, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, '러브합시다', 'Y', 5, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, '파란색', 'Y', 6, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, '비빔밥', 'Y', 7, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, '유진', 'N', 8, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, '대한 독립', 'Y', 9, 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATEST VALUES(SEQ_ATEST_NO.NEXTVAL, 'O', 'Y', 10, 1, 'user01@email.com', 'DFGDFG5623SAD12');


--------------------------------------------------
--------------     연애 고민 질문    ------------------   
--------------------------------------------------
CREATE TABLE F_QLOVE (
    QLOVE_NO NUMBER PRIMARY KEY,
    QLOVE_CONTENT VARCHAR2(3000) NOT NULL,
    QLOVE_DATE DATE DEFAULT SYSDATE NOT NULL,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_QLOVE.QLOVE_NO IS '연애 고민 번호';
COMMENT ON COLUMN F_QLOVE.QLOVE_CONTENT IS '연애 고민 내용';
COMMENT ON COLUMN F_QLOVE.QLOVE_DATE IS '상담 날짜';
COMMENT ON COLUMN F_QLOVE.EMAIL IS '이메일';
COMMENT ON COLUMN F_QLOVE.COUPLE_CODE IS '커플 코드';

CREATE SEQUENCE SEQ_QLOVE_NO
NOCACHE;

INSERT INTO F_QLOVE VALUES(SEQ_QLOVE_NO.NEXTVAL, '나는 영어를 못하는데 유진초이가 자꾸 영어로 말을 걸어.', SYSDATE, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_QLOVE VALUES(SEQ_QLOVE_NO.NEXTVAL, '애신이 영어를 너무 못해', SYSDATE, 'user01@email.com', 'DFGDFG5623SAD12');


--------------------------------------------------
--------------     연애 고민 답변    ------------------   
--------------------------------------------------
CREATE TABLE F_ALOVE (
    ALOVE_NO NUMBER PRIMARY KEY,
    ALOVE_CONTENT VARCHAR2(3000) NOT NULL,
    QLOVE_NO NUMBER  NOT NULL REFERENCES F_QLOVE (QLOVE_NO) ON DELETE CASCADE,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_ALOVE.ALOVE_NO IS '답변 번호';
COMMENT ON COLUMN F_ALOVE.ALOVE_CONTENT IS '답변 내용';
COMMENT ON COLUMN F_ALOVE.QLOVE_NO IS '질문 번호';
COMMENT ON COLUMN F_ALOVE.EMAIL IS '이메일';
COMMENT ON COLUMN F_ALOVE.COUPLE_CODE IS '커플 코드';

CREATE SEQUENCE SEQ_ALOVE_NO
NOCACHE;

INSERT INTO F_ALOVE VALUES(SEQ_ALOVE_NO.NEXTVAL, '유진초이에게 영어를 배워보시는 건 어떨까요?', 1, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ALOVE VALUES(SEQ_ALOVE_NO.NEXTVAL, '애신에게 영어를 자상하게 가르쳐주시는 건 어떨까요?', 2, 'user01@email.com', 'DFGDFG5623SAD12');


--------------------------------------------------
--------------     오늘의 질문    ------------------   
--------------------------------------------------
CREATE TABLE F_QTODAY (
    QTODAY_NO NUMBER PRIMARY KEY,
    QTODAY_CONTENT VARCHAR2(3000) NOT NULL
);

COMMENT ON COLUMN F_QTODAY.QTODAY_NO IS '오늘의 질문 번호';
COMMENT ON COLUMN F_QTODAY.QTODAY_CONTENT IS '오늘의 질문 내용';

CREATE SEQUENCE SEQ_QTODAY_NO
NOCACHE;

INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방에게 가장 감동 받았던 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방에게 가장 큰 고마움을 느꼈던 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '다시 태어난다면 이번 생에서 놓친 기회를 잡고 싶은 순간이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '만약 상대방이 눈앞에서 사라지면 어떻게 반응할 것 같나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 첫 만남에서 가장 인상 깊었던 부분은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '서로 다투었을 때 어떻게 화해하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 제일 좋아하는 음식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 바빠서 연락이 잘 안될 때 어떻게 하시겠습니까?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 여행을 간다면 가장 가고 싶어 할 곳은 어디일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방의 취미 중 하나를 함께 한다면 무엇을 선택하시겠습니까?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신에 대해 가장 자랑스러워하는 점은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '둘 중 하나가 멀리 떠나야 한다면 어떻게 이별을 준비하시겠습니까?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 힘들 때 가장 도움이 되는 방법은 무엇이라고 생각하시나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 이루고 싶은 목표가 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 울고 있을 때 어떤 말을 해주고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '함께한 가장 소중한 기억은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 세상을 떠난다면 그리울 것 같은 일상적인 행동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신을 사랑한다고 느끼게 하는 행동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '만약 둘 중 한 명이 기억을 잃는다면 어떻게 할 건가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '서로에게 비밀로 하고 있는 것이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방의 가장 큰 두려움은 무엇이라고 생각하시나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 무언가를 숨긴다면 어떤 방법으로 알아낼 것 같나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 관계에서 가장 중요하게 생각하는 가치는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 계절은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 싫어하는 상황에 놓였을 때 어떻게 도와주고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 꿈꾸는 미래는 어떤 모습인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가진 최고의 재능은 무엇이라고 생각하시나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방의 이상적인 데이트는 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 힘들 때 들으면 기운이 나는 음악은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 하고 싶은 새로운 도전은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방에게 하고 싶었던 말이 있지만 못한 적이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 잘못을 인정하지 않을 때 어떻게 설득하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께하는 시간 중 가장 즐거웠던 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자기 자신에게 더 자부심을 느꼈으면 하는 점은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방의 인생 목표를 함께 달성하고 싶은가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 외로움을 느낄 때 가장 큰 위로는 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 화났을 때 가장 먼저 해야 할 행동은 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 영화 장르는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 행복한 순간은 언제라고 생각하시나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 노래는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 언젠가 실망할 수 있을 것 같은 점이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 누군가를 사랑하게 된 이유는 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방의 생각이 바뀌도록 영향을 미친 적이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 나를 처음 봤을 때 무슨 생각을 했을까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 가장 가보고 싶은 나라는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 첫 키스는 언제였고, 그때 어떤 감정이었나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방에게 사랑을 표현하는 가장 좋은 방법은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 가장 크게 웃었던 순간은 언제였나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 혼자만의 시간을 원할 때 어떻게 하시겠습니까?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 존경하는 인물은 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 관계에서 절대 포기할 수 없는 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 걸었던 가장 기억에 남는 장소는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신을 처음 사랑하게 된 순간은 언제였을까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방에게 가장 해주고 싶은 선물은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자주 하는 습관 중 귀엽다고 생각하는 것이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 첫 여행은 어디였나요? 그 여행은 어땠나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 하는 말버릇은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신을 위해 해준 가장 감동적인 행동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 한 순간 중 가장 웃겼던 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 더 많은 시간을 보내고 싶은 이유는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어떤 상황에서 가장 매력적이라고 느껴지나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 행복해 보였던 순간은 언제였나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 감동받는 선물을 고른다면 어떤 것이 좋을까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방의 가장 큰 꿈은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 때 꿈꾸던 직업은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 하는 가장 평범한 하루가 가장 특별하게 느껴질 때는 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자신있어 하는 재능은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방에게 한 번도 말하지 못했지만 전하고 싶은 말이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 색깔은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 가장 하고 싶은 취미는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 열정적으로 좋아하는 주제는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 책은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 운동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 나와 함께 있을 때 가장 많이 하는 말은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 언제 가장 외로움을 느낀다고 생각하시나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 꿈꾸고 싶은 미래는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 마음이 편안해지는 장소는 어디일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신을 칭찬받을 때 가장 부끄러워하는 부분은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 갑자기 하루를 혼자 보내야 한다면 무엇을 할 것 같나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신에게 가장 많이 의지할 때는 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 추억 중 가장 소중한 한 장면을 꼽자면 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방에게 감사의 마음을 표현하고 싶은 순간이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 더 많은 시간을 보내기 위해 무엇을 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신을 아끼고 있다는 것을 느끼는 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 살고 싶은 도시가 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 첫 만남에서 가장 인상 깊었던 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신에게 처음으로 사랑한다고 말한 순간은 언제였나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 하는 것이 가장 편안하게 느껴지는 이유는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신과 함께 있을 때 가장 좋아하는 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자주 사용하는 이모티콘이나 말투는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 힘들 때 가장 먼저 의지하고 싶은 사람은 누구일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께한 가장 기억에 남는 생일은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 하는 시간 중 가장 평범한 순간이 가장 특별하게 느껴질 때는 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 무언가를 성취했을 때 가장 먼저 해주고 싶은 말은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 두려워하는 일은 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방에게 한 번도 해보지 못한 질문이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 가장 가보고 싶은 국내 여행지는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자기 자신을 더 아끼고 사랑했으면 좋겠다고 느낀 적이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 기쁠 때 당신에게 가장 먼저 전하고 싶은 소식은 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 관계에서 가장 중요한 요소는 무엇이라고 생각하시나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 힘들어했을 때 당신은 어떻게 도와주고 싶었나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자랑스러워할 만한 최근의 성취는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어떤 사람들과 함께 있으면 가장 편안해 하나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 하는 날의 아침에 가장 기대되는 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 싫어하는 음식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 관계에서 가장 감사하게 느껴지는 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신에게 보여준 가장 큰 신뢰는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 존경하는 사람은 누구일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 여행을 간다면 가장 가보고 싶어하는 나라는 어디일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 만들어보고 싶은 추억은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 항상 꿈꿔온 목표는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 첫 데이트에서 느꼈던 감정은 무엇이었나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자신있게 대화하는 주제는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 가장 자주 가는 장소는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 나누고 싶은 버킷리스트가 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 헤어졌을 때 가장 그리워할 점은 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자주 사용하는 애정 표현은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 혼자만의 시간을 가질 때 가장 좋아하는 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 도전했던 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방에게 갑작스럽게 하루 휴가가 주어진다면 무엇을 할 것 같나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 관계에서 가장 소중한 가치는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 감명 깊게 본 영화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 스트레스를 받을 때 어떻게 도와주고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 불안을 느낄 때 가장 안정감을 주는 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 가장 가보고 싶은 국내 여행지는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 가장 하고 싶은 취미 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 듣고 싶은 음악 장르는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 향기는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 소중히 여기는 물건은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자주 보는 TV 프로그램은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신만의 시간을 가질 때 즐기는 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 스트레스를 받을 때 가장 큰 위로가 되는 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 계절은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 첫 만남에서 가장 기억에 남는 대화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 제일 가보고 싶은 장소는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 기억하고 싶은 특별한 날은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 힘들어할 때 가장 도움이 되는 행동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 나에게 바라는 것은 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 스포츠가 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신에게 가장 중요하게 생각하는 가치는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 배운 새로운 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 처음으로 함께 요리해보고 싶은 음식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신을 가장 잘 표현하는 방법은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 하고 싶은 이색 데이트는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가지고 있는 가장 큰 장점은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 나누고 싶은 가장 큰 비밀은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신에게 기대하는 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 하고 싶은 가장 로맨틱한 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과의 관계에서 꼭 이루고 싶은 목표는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신을 사랑한다고 느꼈던 가장 강렬한 순간은 언제였나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 동물은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 아침에 가장 먼저 하는 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 꿈꾸는 완벽한 하루는 어떤 모습일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 편안하게 느끼는 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 보고 싶은 영화가 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가지고 있는 특이한 취미가 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 꼭 가보고 싶은 해외 여행지는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 요리할 때 가장 잘 만드는 요리는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 새로운 언어를 배운다면 어떤 언어를 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 계절에 함께 하고 싶은 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방의 웃음소리가 가장 인상적이었던 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 휴식 방법은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신에게서 배우고 싶은 것은 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 놀이공원의 놀이기구는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 음악을 들을 때 가장 감동적인 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 행복했던 추억 중 하나는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 의상 스타일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신의 장점으로 꼽는 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기분 좋게 받았던 칭찬은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 적 가장 좋아했던 만화 캐릭터는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 자연 풍경은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 보내고 싶은 꿈의 휴가는 어떤 모습인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 존경하는 역사적 인물은 누구일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 적 꿈꿨던 미래 모습은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 과일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 처음으로 함께 하고 싶은 모험은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 편안하게 느끼는 소리는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 드라마나 시리즈는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 보내고 싶은 가장 낭만적인 저녁은 어떤 모습인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자신있게 말할 수 있는 주제는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 갑자기 많은 돈을 얻게 된다면 무엇을 가장 먼저 하고 싶을까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신과 함께 도전해보고 싶은 것은 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 꽃은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 완벽한 주말을 보낸다면 무엇을 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신에게서 가장 사랑스러운 부분은 무엇이라고 말할까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 가장 하고 싶은 겨울 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 가장 하고 싶은 여름 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 옷 스타일은 어떤가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신에게 가장 먼저 알려주고 싶은 비밀은 무엇일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 했던 운동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 디저트는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가진 독특한 습관이 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 도시는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 집에서 보내고 싶은 완벽한 하루는 어떤 모습인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 향수나 향기는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 해보고 싶은 스포츠나 액티비티는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신과 함께 가장 좋아하는 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기대하는 미래의 모습은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 노래는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 가장 기억에 남는 여행지는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 책은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 배우고 싶은 새로운 기술이나 취미는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 적 가장 자주 했던 놀이가 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 평생 기억에 남을 이벤트는 무엇을 계획하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신만의 특별한 요리 레시피가 있나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 가는 식당은 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 패션 아이템은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 행복해 보였던 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 혼자만의 시간을 어떻게 보내는 것을 좋아하나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 가장 웃었던 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 커피나 차는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 가장 기억에 남는 저녁 식사는 언제였나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 듣는 음악 장르는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 칵테일이나 음료는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 운동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 가족과의 추억은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신에게서 배운 가장 중요한 교훈은 무엇이라고 생각하나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 편안함을 느끼는 옷 스타일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 나누고 싶은 미래의 꿈은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 피자 토핑은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 영화 장르는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신에게 가장 자주 하는 칭찬은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 TV 쇼나 예능 프로그램은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 해보고 싶은 해외 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 사랑하는 어린 시절의 추억은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 보고 싶은 공연은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 도시에서의 데이트는 어떤 모습일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 색깔은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방과 함께 가장 가고 싶은 레스토랑은 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 스트레스를 받을 때 가장 좋아하는 해결 방법은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 당신과 가장 자주 하는 대화 주제는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 아침 식사는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 주말에 가장 하고 싶은 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 가수가 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 많이 사용하는 앱은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 많이 웃었던 농담이나 상황은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 관심을 갖고 있는 주제는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 즐거워했던 생일은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 요즘 즐겨 보는 유튜브 채널은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 요즘 자주 먹는 간식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 구입한 가장 기쁜 물건은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 했던 기부는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 요즘 배우고 싶어하는 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 존경하는 사람은 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 영화 장르는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 인생에서 가장 기억에 남는 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 가보고 싶은 나라는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 운동선수는 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 음료는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 스트레스를 받을 때 가장 먼저 하는 행동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 즐거워했던 여름 휴가지는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 간식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 연예인은 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 본 영화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 듣는 팟캐스트나 라디오 프로그램은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 쓰는 이모티콘은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 동화나 소설은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 주말에 가장 하고 싶은 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 즐겨 보는 웹툰이나 만화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 게임은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 많이 웃었던 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자신 있는 요리는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 적 가장 좋아했던 장난감은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 휴일은 어떤 날인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 즐겨하는 취미는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 한 운동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 계절은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 때 꿈꿨던 직업은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 한 기분 좋은 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 아끼는 물건은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 제일 좋아하는 주말 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 향기는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 읽은 책은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 과일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 존경하는 인물은 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 아이스크림 맛은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 영화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 스포츠는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 때 좋아했던 TV 프로그램은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 패션 브랜드는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 향수는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 즐겨 찾는 카페는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 레스토랑 메뉴는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 먹는 아침 식사는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기대하고 있는 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 즐겨하는 온라인 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 도전해 보고 싶은 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 평소에 즐겨하는 자기 관리 방법은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 스포츠 팀은 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 친구와 함께한 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 앱은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 주말에 가장 하고 싶은 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 여행지는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 스트레스를 받을 때 주로 하는 행동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어린 시절 가장 좋아했던 음식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 존경하는 가족 구성원은 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 즐겨하는 운동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 영화 감독은 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 행복했던 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자신 있는 취미는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 배우고 싶은 기술은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 계절은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 평소에 자주 즐기는 TV 프로그램은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 동물은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 아끼는 취미 용품은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 하고 싶은 도전은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 기억에 남는 경험은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 빵 종류는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 과자는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 뮤지컬은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 적에 가장 즐겨하던 놀이는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 친구들에게 자주 추천하는 영화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 즐겁게 보낸 날은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 야식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 행복한 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 꽃은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 보고 싶어했던 영화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기억에 남는 생일 선물은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 적 가장 좋아했던 동화책은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자신 있는 게임은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 아이스크림 맛은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 아끼는 신발은 어떤 스타일인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 보드게임은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 날씨는 어떤 날씨인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 좋아한 책은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자주 가고 싶은 해외 여행지는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 스마트폰 기능은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 앱은 어떤 것인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 브랜드는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 보고 싶어했던 콘서트는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 듣는 음악은 어떤 장르인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 스포츠는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 기쁘게 느꼈던 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 간식은 어떤 종류인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 계절에 대한 이유는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 행복해지는 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 휴가 스타일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 색깔은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 스트레스를 해소하는 방법은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어렸을 때 가장 좋아했던 장난감은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 TV 드라마는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 들었던 좋은 소식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 가고 싶은 콘서트는 누구의 공연인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 즐겨 찾는 카페에서 주로 마시는 음료는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 명절 음식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 아침 식사 메뉴는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 가보고 싶은 도시나 나라는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 구매한 물건 중 가장 만족스러운 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 디저트는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 즐겨 보는 유튜브 채널은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 계절 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 휴가 계획은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 평소에 자주 하는 취미는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 꽃 종류는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 감명 깊게 본 영화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 읽은 책은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 액세서리는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 즐겨 듣는 팟캐스트는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기억에 남는 가족 여행은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 먹고 싶어했던 음식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 아끼는 소지품은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 때 가장 좋아했던 애니메이션은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 주말에 가장 자주 하는 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 휴대폰 앱은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 도전해 보고 싶은 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 그림이나 미술 작품은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 구매한 물건 중 가장 만족스러운 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 축제는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 신발 브랜드는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 추억의 장소는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 듣는 노래는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 방문하는 웹사이트는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 즐거웠던 휴가는 어디였나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 스포츠 팀은 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 경험한 가장 특별한 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 드라마 캐릭터는 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 연휴는 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 가는 음식점은 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 기대하고 있는 계획은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 명절은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 기분 좋게 느꼈던 순간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 해외 여행지는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 소셜 미디어는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 감동받았던 영화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 적 가장 좋아했던 게임은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 전통 음식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어린 시절 꿈꿨던 직업은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 테마파크는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 아끼는 의류 브랜드는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어렸을 때 즐겨 보던 TV 프로그램은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 도시의 랜드마크는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 자랑스러워했던 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어릴 적 가장 좋아했던 캐릭터는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 본 연극이나 뮤지컬은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 사진 촬영 장소는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 즐기는 운동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 명언은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어렸을 때 가장 좋아했던 과자는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어렸을 때 자주 하던 놀이는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 영화 장르는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어렸을 때 즐겨하던 취미는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 좋아했던 패션 스타일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 이모티콘은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 어렸을 때 가장 좋아했던 스포츠는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 평소에 즐겨 듣는 라디오 방송은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 좋아한 축제는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 쓰는 문구류는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 피자 토핑은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 찾는 웹사이트는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 종류의 영화는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 수영장은 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 기대했던 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 바다의 색깔은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 마시는 커피 종류는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 동화 속 주인공은 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 가는 카페 메뉴는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 재미있게 했던 게임은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 먹는 아침 메뉴는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 빙수 토핑은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 여름 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 디저트 카페는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 도전해 본 새로운 취미는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 크리스마스 장식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기억에 남는 캠핑 경험은 언제였나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 향기는 어떤 향인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 감명 깊게 읽은 책은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 패션 아이템은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기대하는 여름 휴가 계획은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기억에 남는 첫 만남은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 벚꽃 명소는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 햄버거 체인은 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 음성 메시지 앱은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 비타민 음료는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기억에 남는 생일 선물은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 만화 캐릭터는 누구인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 감명 깊게 읽은 시는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 운동 기구는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자주 방문하는 온라인 쇼핑몰은 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 커플 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 간식으로 먹었던 것은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기억에 남는 수업은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 가을 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 고양이 또는 강아지 품종은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자주 가는 헬스장 이름은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 록 밴드는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 피아노 곡은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 기분 좋게 느낀 일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 식사 시간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 헤어 스타일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기대하는 새해 목표는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가고 싶은 전시회는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 커플 노래는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 감명 깊게 봤던 다큐멘터리는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 최근에 감동한 영화의 장면은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 채소는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 이색 음식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 세일 기간은 언제인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기억에 남는 가족 모임은 언제였나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 라면 브랜드는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기대하고 있는 연극은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 스낵은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 액티비티는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 즐거운 추억을 가진 장소는 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 가는 슈퍼마켓은 어디인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 도전해보고 싶은 음식은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 주방 도구는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 포켓몬은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 아이스크림 맛은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 웹툰은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 최근에 가장 재미있게 본 유튜브 영상은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 조리법은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 자주 사용하는 운동화 브랜드는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 기대하는 스포츠 이벤트는 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 좋아하는 과일은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 가장 즐겨 하는 주말 활동은 무엇인가요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 만약 외계인과 대화를 할 수 있다면, 어떤 이야기를 나누고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 하루 동안 어떤 동물로 변신할 수 있다면, 어떤 동물이 되고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신의 집을 마법의 성으로 만들 수 있다면, 어떤 장식을 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 시간을 여행할 수 있다면, 어떤 시대에 가고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 원하는 초능력을 가질 수 있다면, 어떤 능력을 원하나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 좋아하는 캐릭터와 하루를 보낼 수 있다면, 누구와 어떤 일을 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 판타지 세계에 살 수 있다면, 어떤 세계에서 어떤 역할을 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 미래의 도시를 설계할 수 있다면, 어떤 모습으로 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 원주율을 마음대로 바꿀 수 있다면, 어떤 숫자를 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 인공지능과 친구가 될 수 있다면, 어떤 AI와 가장 친하게 지내고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신의 생일 파티를 우주에서 연다면, 어떤 테마로 꾸미고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 상상의 나라를 만든다면, 그곳은 어떤 모습일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 원하는 음식을 스스로 만들어낼 수 있다면, 어떤 음식을 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 모든 언어를 한 번에 배울 수 있다면, 어떤 언어부터 배우고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신만의 로봇을 만들 수 있다면, 어떤 기능을 가지고 있기를 원하나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 영화 속 한 장면에 등장할 수 있다면, 어떤 장면을 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 세상을 바꿀 수 있는 발명품을 만든다면, 어떤 발명품을 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 꿈속의 세상을 탐험할 수 있다면, 어떤 세상을 탐험하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 모든 동물과 대화할 수 있다면, 어떤 동물과 이야기를 나누고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 마법의 능력을 가질 수 있다면, 어떤 마법을 쓰고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 대체 현실에서 살 수 있다면, 어떤 현실을 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 새로운 색깔을 만들 수 있다면, 어떤 색을 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 자신의 이야기를 책으로 쓴다면, 어떤 제목을 붙이고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 꿈의 직업을 가질 수 있다면, 어떤 직업을 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '상대방이 동화 속 왕국의 왕이나 왕비가 된다면, 어떤 정책을 펼치고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 하루 동안 투명인간이 된다면, 무엇을 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 꿈속의 세계에서 살 수 있다면, 어떤 세상을 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 우주 여행을 할 수 있다면, 어떤 행성을 탐험하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 상상의 동물을 만들 수 있다면, 어떤 동물을 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 특별한 능력을 가질 수 있다면, 어떤 능력을 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 역사 속 인물과 하루를 보낼 수 있다면, 누구와 어떤 이야기를 나누고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 원하는 장소로 순간이동할 수 있다면, 어디로 가고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 자신의 이야기를 영화로 만든다면, 어떤 주제를 다루고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 꿈의 직업을 가질 수 있다면, 어떤 직업을 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 인생을 다시 시작할 수 있다면, 어떤 선택을 다르게 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 동물로 태어날 수 있다면, 어떤 동물로 태어나고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 마법의 능력을 가질 수 있다면, 어떤 마법을 쓰고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 원하는 무기를 만들 수 있다면, 어떤 무기를 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 꿈의 집을 디자인할 수 있다면, 어떤 스타일로 꾸미고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 가상의 친구를 만든다면, 그 친구는 어떤 성격을 가질까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 어느 시대에 살고 싶다면, 어떤 시대를 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 모든 언어를 이해할 수 있다면, 어떤 언어로 대화하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 세상을 바꿀 수 있는 발명품을 만든다면, 어떤 발명품을 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 가장 좋아하는 캐릭터와 함께 하루를 보낼 수 있다면, 누구와 어떤 일을 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 초능력을 가질 수 있다면, 어떤 초능력을 원하나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 판타지 세계에서 살 수 있다면, 어떤 역할을 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 가장 좋아하는 영화의 한 장면에 등장할 수 있다면, 어떤 장면을 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 꿈의 나라를 만들 수 있다면, 그곳은 어떤 모습일까요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 외계인과 대화를 할 수 있다면, 어떤 이야기를 나누고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 시간 여행을 할 수 있다면, 어떤 과거로 가고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 새로운 색깔을 만들 수 있다면, 어떤 색을 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 원하는 소설의 주인공이 된다면, 어떤 이야기를 원하나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 한 가지 음식만 먹을 수 있다면, 어떤 음식을 선택하겠습니까?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 마법의 성을 가질 수 있다면, 어떤 방을 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 원하는 하늘의 별을 선택할 수 있다면, 어떤 별을 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 마음대로 여행할 수 있는 세계를 만든다면, 어떤 세계를 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 모든 것이 가능한 세계에서 살 수 있다면, 어떤 일을 해보고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 한 가지 소원만 이룰 수 있다면, 어떤 소원을 빌고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 자신의 이야기를 만화로 그릴 수 있다면, 어떤 이야기를 그리겠습니까?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 사막의 왕이 된다면, 어떤 법칙을 제정하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 가장 좋아하는 장소에서 하루를 보낼 수 있다면, 어디에서 무엇을 하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 마법의 물약을 만들 수 있다면, 어떤 효과를 주고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 한 가지 동화를 현실로 만들 수 있다면, 어떤 동화를 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 한 가지 과거의 사건을 바꿀 수 있다면, 어떤 사건을 바꾸고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 원하는 직업을 꿈꿀 수 있다면, 어떤 직업을 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 우주선의 선장이 된다면, 어떤 여행을 떠나고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 모든 꿈을 이룰 수 있는 기회가 주어진다면, 가장 먼저 어떤 꿈을 이뤄보고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 어떤 물체든 자유롭게 변형할 수 있다면, 무엇을 만들고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 특별한 능력으로 세상을 여행할 수 있다면, 어디로 가고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 나무가 될 수 있다면, 어떤 나무가 되고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 시간의 흐름을 조절할 수 있다면, 어떤 순간을 다시 경험하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 자신만의 비밀 장소를 가질 수 있다면, 어떤 장소를 원하나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 어떤 요소를 선택해서 세상을 만들어볼 수 있다면, 어떤 요소를 선택하고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 물속에서 살 수 있다면, 어떤 해양 생물과 함께 살고 싶나요?');
INSERT INTO F_QTODAY VALUES(SEQ_QTODAY_NO.NEXTVAL, '당신이 만약 신비한 책을 발견한다면, 어떤 내용을 알고 싶나요?');


--------------------------------------------------
--------------     오늘의 답변    ------------------   
--------------------------------------------------
CREATE TABLE F_ATODAY (
    ATODAY_NO NUMBER PRIMARY KEY,
    ATODAY_CONTENT VARCHAR2(3000),
    ATODAY_DATE DATE,
    QTODAY_DATE DATE DEFAULT SYSDATE NOT NULL,
    QTODAY_NO NUMBER  NOT NULL REFERENCES F_QTODAY (QTODAY_NO) ON DELETE CASCADE,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_ATODAY.ATODAY_NO IS '오늘의 답변 번호';
COMMENT ON COLUMN F_ATODAY.ATODAY_CONTENT IS '오늘의 답변 내용';
COMMENT ON COLUMN F_ATODAY.ATODAY_DATE IS '답변 등록 날짜';
COMMENT ON COLUMN F_ATODAY.QTODAY_DATE IS '질문 날짜';
COMMENT ON COLUMN F_ATODAY.QTODAY_NO IS '질문 번호';
COMMENT ON COLUMN F_ATODAY.EMAIL IS '이메일';
COMMENT ON COLUMN F_ATODAY.COUPLE_CODE IS '커플 코드';

CREATE SEQUENCE SEQ_ATODAY_NO
NOCACHE;

INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '매시간 매분 매초', TO_DATE('20240922', 'YYYY-MM-DD'), TO_DATE('20240922', 'YYYY-MM-DD'), 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '당연합니다.', TO_DATE('20240923', 'YYYY-MM-DD'), TO_DATE('20240923', 'YYYY-MM-DD'), 2, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '데리고 살아야지요..', TO_DATE('20240924', 'YYYY-MM-DD'), TO_DATE('20240924', 'YYYY-MM-DD'), 3, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '애신이 여자라서 사랑하는 게 아닙니다. 저는 애신 그 자체를 사랑하는 겁니다. 때문에 성별이 바뀐다 해도 애신에 대한 제 사랑은 식지 않을 것입니다.', TO_DATE('20240925', 'YYYY-MM-DD'), TO_DATE('20240925', 'YYYY-MM-DD'), 4, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '총 들고 설치는 것', TO_DATE('20240926', 'YYYY-MM-DD'), TO_DATE('20240926', 'YYYY-MM-DD'), 5, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '가만히 있을 때', TO_DATE('20240922', 'YYYY-MM-DD'), TO_DATE('20240922', 'YYYY-MM-DD'), 1, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '당연하오', TO_DATE('20240923', 'YYYY-MM-DD'), TO_DATE('20240923', 'YYYY-MM-DD'), 2, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '어쩔 수 없지요.', TO_DATE('20240924', 'YYYY-MM-DD'), TO_DATE('20240924', 'YYYY-MM-DD'), 3, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '상관없습니다.', TO_DATE('20240925', 'YYYY-MM-DD'), TO_DATE('20240925', 'YYYY-MM-DD'), 4, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ATODAY VALUES(SEQ_ATODAY_NO.NEXTVAL, '내가 나서는 것을 싫어하오.', TO_DATE('20240926', 'YYYY-MM-DD'), TO_DATE('20240926', 'YYYY-MM-DD'), 5, 'user02@email.com', 'DFGDFG5623SAD12');


--------------------------------------------------
--------------     금융정보1    ------------------   
--------------------------------------------------
CREATE TABLE F_BCATE (
    BCATE_NO NUMBER PRIMARY KEY,
    BCATE_NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_BCATE.BCATE_NO IS '번호';
COMMENT ON COLUMN F_BCATE.BCATE_NAME IS '카테고리명';
COMMENT ON COLUMN F_BCATE.EMAIL IS '이메일';
COMMENT ON COLUMN F_BCATE.COUPLE_CODE IS '커플 코드';

CREATE SEQUENCE SEQ_BCATE_NO
NOCACHE;

INSERT INTO F_BCATE VALUES(SEQ_BCATE_NO.NEXTVAL, '외식', 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_BCATE VALUES(SEQ_BCATE_NO.NEXTVAL, '데이트', 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_BCATE VALUES(SEQ_BCATE_NO.NEXTVAL, '외식', 'user03@email.com', 'A1B2C3D4E5F6G7H');
INSERT INTO F_BCATE VALUES(SEQ_BCATE_NO.NEXTVAL, '데이트', 'user03@email.com', 'A1B2C3D4E5F6G7H');


--------------------------------------------------
--------------     금융정보2    ------------------   
--------------------------------------------------
CREATE TABLE F_BUDGET (
    BUDGET_NO NUMBER PRIMARY KEY,
    BUDGET_DATE DATE NOT NULL,
    BUDGET_BRIEFS VARCHAR2(90) NOT NULL,
    BUDGET_HOWMUCH NUMBER NOT NULL,
    BUDGET_CURRENCY VARCHAR2(8) CHECK (BUDGET_CURRENCY IN ('₩', '$', '€', '￥(JPY)', '¥(CNY)')) NOT NULL,
    BUDGET_BALANCE NUMBER NOT NULL,
    BUDGET_CATE NUMBER REFERENCES F_BCATE (BCATE_NO) ON DELETE CASCADE,
    BUDGET_METHOD CHAR(1) CHECK (BUDGET_METHOD IN ('A', 'K', 'C')),
    BUDGET_COMM VARCHAR2(300),
    BUDGET_INOUT CHAR(1) CHECK (BUDGET_INOUT IN ('I', 'O')) NOT NULL,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_BUDGET.BUDGET_NO IS '번호';
COMMENT ON COLUMN F_BUDGET.BUDGET_DATE IS '날짜';
COMMENT ON COLUMN F_BUDGET.BUDGET_BRIEFS IS '적요';
COMMENT ON COLUMN F_BUDGET.BUDGET_HOWMUCH IS '금액';
COMMENT ON COLUMN F_BUDGET.BUDGET_CURRENCY IS '통화';
COMMENT ON COLUMN F_BUDGET.BUDGET_BALANCE IS '잔액';
COMMENT ON COLUMN F_BUDGET.BUDGET_CATE IS '카테고리';
COMMENT ON COLUMN F_BUDGET.BUDGET_METHOD IS '계좌 : A / 카드 : K / 현금 : C';
COMMENT ON COLUMN F_BUDGET.BUDGET_COMM IS '메모';
COMMENT ON COLUMN F_BUDGET.BUDGET_INOUT IS '수입 : I / 지출 : O';
COMMENT ON COLUMN F_BUDGET.EMAIL IS '이메일';
COMMENT ON COLUMN F_BUDGET.COUPLE_CODE IS '커플 코드';

CREATE SEQUENCE SEQ_BUDGET_NO
NOCACHE;

INSERT INTO F_BUDGET VALUES(SEQ_BUDGET_NO.NEXTVAL, TO_DATE('20240929', 'YYYY-MM-DD'), '탕후루', 5000, '₩', 100000, 1, 'C', NULL, 'O', 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_BUDGET VALUES(SEQ_BUDGET_NO.NEXTVAL, TO_DATE('20240930', 'YYYY-MM-DD'), '엽떡 + 허니콤보', 36200, '₩', 63800, 1, 'K', NULL, 'O', 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_BUDGET VALUES(SEQ_BUDGET_NO.NEXTVAL, TO_DATE('20241001', 'YYYY-MM-DD'), '10월 입금', 200000, '₩', 263800, NULL, NULL, NULL, 'I', 'user01@email.com', 'DFGDFG5623SAD12');


--------------------------------------------------
--------------     기초 설문 질문    ------------------   
--------------------------------------------------
CREATE TABLE F_QSERVEY (
    QSERVEY_NO NUMBER PRIMARY KEY,
    QSERVEY_CONTENT VARCHAR2(3000) NOT NULL
);

COMMENT ON COLUMN F_QSERVEY.QSERVEY_NO IS '기초 설문 번호';
COMMENT ON COLUMN F_QSERVEY.QSERVEY_CONTENT IS '기초 설문 내용';

CREATE SEQUENCE SEQ_QSERVEY_NO
NOCACHE;

INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '정식으로 교제를 시작한 날짜는 언제인가요?(YYYY-MM-DD)');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '첫 만남의 장소는 어디였나요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '처음으로 함께 본 영화는 무엇이었나요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '첫 데이트 장소는 어디였나요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 음식은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 색깔은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 취미는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 영화는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 노래는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '첫 여행은 어디로 갔다오셨나요?');

INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 생일은 언제신가요?(YYYY-MM-DD)');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 동물은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 계절은 언제인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 신발 사이즈는 몇입니까?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 스포츠 또는 신체 활동은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 휴식 방법은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 혈액형은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 가족 관계는 어떻게 되나요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 디저트는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 가장 큰 트라우마는 무엇인가요?');

INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 꿈꾸는 휴가지는 어디인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 식당은 어디인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 애인에게 가장 먼저 선물한 것은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 애인에게 가장 먼저 선물 받은 것은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 싫어하는 행동은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 꿈은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 목표는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 예능은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 좋아하는 드라마는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 경험했던 모든 순간 중 가장 황당했던 때는 언제인가요?');

INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 좋아하는 책은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 하기 싫은 집안일은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 고향은 어디신가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 추구하는 옷 스타일은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 좋아하는 음료는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신은 보통 몇시에 기상하시나요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신은 보통 몇시에 취침하시나요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '지금까지 인생에서 가장 큰 성취는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 첫 직업은 무엇이었나요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 주말을 즐기는 방법은 무엇인가요?');

INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '인생의 첫 기억은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '만약 유명인과 식사를 할 수 있게 된다면, 누구와 함께하고 싶으신가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '인생에서 가장 중요한 가치는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '가장 좋아하는 음악의 장르는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신을 가장 잘 설명하는 세 단어는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '노력없이 한가지 기술을 습득할 수 있다면, 어떤 기술을 배우고 싶으신가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '이것이 없다면 당신은 살 수 없습니다. 이것은 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '만약 과거로 돌아갈 수 있다면, 언제로 돌아가고 싶으신가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신의 매력 포인트는 무엇인가요?');
INSERT INTO F_QSERVEY VALUES(SEQ_QSERVEY_NO.NEXTVAL, '당신이 가장 잘 만들 수 있는 요리는 무엇인가요?');

--------------------------------------------------
--------------     기초 설문 답변    ------------------   
--------------------------------------------------
CREATE TABLE F_ASERVEY (
    ASERVEY_NO NUMBER PRIMARY KEY,
    ASERVEY_CONTENT VARCHAR2(3000) NOT NULL,
    QSERVEY_NO NOT NULL REFERENCES F_QSERVEY (QSERVEY_NO) ON DELETE CASCADE,
    EMAIL VARCHAR2(100) NOT NULL REFERENCES C_MEMBER (EMAIL) ON DELETE CASCADE,
    COUPLE_CODE VARCHAR2(15) NOT NULL REFERENCES C_COUPLE (COUPLE_CODE) ON DELETE CASCADE
);

COMMENT ON COLUMN F_ASERVEY.ASERVEY_NO IS '기초 설문 답변 번호';
COMMENT ON COLUMN F_ASERVEY.ASERVEY_CONTENT IS '기초 설문 답변 내용';
COMMENT ON COLUMN F_ASERVEY.QSERVEY_NO IS '기초 설문 번호 ';
COMMENT ON COLUMN F_ASERVEY.EMAIL IS '이메일';
COMMENT ON COLUMN F_ASERVEY.COUPLE_CODE IS '커플 코드';

CREATE SEQUENCE SEQ_ASERVEY_NO
NOCACHE;

INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '1905-08-18', 1, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '평양시가지', 2, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '엘리멘탈', 3, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '논산', 4, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '약과', 5, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '빨강', 6, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '애신 영어 가르치기', 7, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '타이타닉', 8, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, 'HYPE BOY', 9, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '미국', 10, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '1863-01-01', 11, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '강아지', 12, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '겨울', 13, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '280mm', 14, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '야구', 15, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '애신과 누워있기', 16, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, 'A', 17, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '양부모님', 18, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '딸기 타르트', 19, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '친부모님의 죽음', 20, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '경주', 21, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '불란서 제빵소', 22, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '사랑', 23, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '사랑', 24, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '애신과 평생 함께하는 것', 25, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '애신이 위험한 일은 하는 것', 26, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '애신과 안전하게 사는 것', 27, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '대탈출4', 28, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '미스터 션샤인', 29, 'user01@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '애신과의 첫 만남', 30, 'user01@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '유진초이의 고향', 21, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '불란서 제빵소', 22, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '이상함', 23, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '불쾌함', 24, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '나 대신 누명 쓰는 것', 25, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '대한 독립', 26, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '대한 독립 후 유진초이와 결혼', 27, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '크라임씬2', 28, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '미스터 션샤인', 29, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '유진초이와의 첫 만남', 30, 'user02@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '미스터 션샤인', 31, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '빨래', 32, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '대한민국', 33, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '전통', 34, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '식혜', 35, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '7am', 36, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '11pm', 37, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '유진초이를 만난 것', 38, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '아씨', 39, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '유진초이와 도란도란 이야기 나누기', 40, 'user02@email.com', 'DFGDFG5623SAD12');

INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '유진초이와 뮤지컬 관람', 41, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '가족들과 마루에서 약과를 먹으며 도란도란 이야기했던 것', 42, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '일론머스크', 43, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '신념', 44, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '힙합', 45, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '명랑, 용기, 기세', 46, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '암살', 47, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '유진초이', 48, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '머리부터 발끝까지 다', 49, 'user02@email.com', 'DFGDFG5623SAD12');
INSERT INTO F_ASERVEY VALUES(SEQ_ASERVEY_NO.NEXTVAL, '없음', 50, 'user02@email.com', 'DFGDFG5623SAD12');


--------------------------------------------------
--------------     사진(스토리)	    ------------------	
--------------------------------------------------
CREATE TABLE A_STORY(
	STORY_NO NUMBER PRIMARY KEY,
	COUPLE_CODE VARCHAR2(50) REFERENCES C_COUPLE ON DELETE CASCADE,
	WRITER_EMAIL VARCHAR2(100) REFERENCES C_MEMBER ON DELETE CASCADE,
	STORY_TITLE VARCHAR2(100) NOT NULL,
	CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
	REPLY_COUNT NUMBER DEFAULT 0,
	ORIGIN_NAME VARCHAR2(100) ,
	CHANGE_NAME VARCHAR2(1000),
	STATUS VARCHAR2(10) DEFAULT 'Y' 
);

CREATE SEQUENCE SEQ_STORY;

INSERT INTO A_STORY VALUES(SEQ_STORY.NEXTVAL, 'A1B2C3D4E5F6G7H', 'user04@email.com', '우리 처음 만난 날', '2024-05-09', 2, NULL, 'resources/upfiles/2024101918022257237.jpg', 'Y');
INSERT INTO A_STORY VALUES(SEQ_STORY.NEXTVAL, 'A1B2C3D4E5F6G7H', 'user04@email.com', '우리 두번째 만난 날', '2024-05-25', 1, NULL, 'resources/upfiles/2024102115521588323.PNG', 'Y');
INSERT INTO A_STORY VALUES(SEQ_STORY.NEXTVAL, 'A1B2C3D4E5F6G7H', 'user04@email.com', '우리 세번째 만난 날', '2024-05-27', 0, NULL, 'resources/upfiles/2024102116052879512.PNG', 'Y');
INSERT INTO A_STORY VALUES(SEQ_STORY.NEXTVAL, 'A1B2C3D4E5F6G7H', 'user04@email.com', '우리 네번째 만난 날', '2024-06-03', 2, NULL, 'resources/upfiles/2024101812064061483.jfif', 'Y');
INSERT INTO A_STORY VALUES(SEQ_STORY.NEXTVAL, 'A1B2C3D4E5F6G7H', 'user04@email.com', '우리 마지막 만난 날', '2024-07-18', 0, NULL, 'resources/upfiles/2024102116350816947.jfif', 'Y');

--------------------------------------------------
--------------     댓글	    ------------------	
--------------------------------------------------

CREATE TABLE A_REPLY(
	REPLY_NO NUMBER PRIMARY KEY,
	REF_SNO NUMBER REFERENCES A_STORY ON DELETE CASCADE,
	REPLY_WRITER VARCHAR2(100) REFERENCES C_MEMBER(EMAIL) ON DELETE CASCADE,
	REPLY_CONTENT VARCHAR2(3000) NOT NULL,
	REPLY_LIKE NUMBER DEFAULT 0,
	CREATE_DATE DATE DEFAULT SYSDATE,
	STATUS VARCHAR2(10) DEFAULT 'Y'
);

CREATE SEQUENCE SEQ_REPLY;

INSERT INTO A_REPLY VALUES (SEQ_REPLY.NEXTVAL, 1, 'user04@email.com', '부산에서 진짜 재밌었는데~', 0, TO_DATE('202405251600', 'YYYYMMDDHH24MISS'), 'Y');
INSERT INTO A_REPLY VALUES (SEQ_REPLY.NEXTVAL, 1, 'user03@email.com', 'ㅇㅈ~', 0, TO_DATE('202405251602', 'YYYYMMDDHH24MISS'), 'Y');
INSERT INTO A_REPLY VALUES (SEQ_REPLY.NEXTVAL, 2, 'user04@email.com', '서울은 역시 크다', 0, TO_DATE('202406051756', 'YYYYMMDDHH24MISS'), 'Y');
INSERT INTO A_REPLY VALUES (SEQ_REPLY.NEXTVAL, 4, 'user04@email.com', '부산 또 가도 재밌네', 0, TO_DATE('202407012203', 'YYYYMMDDHH24MISS'), 'Y');
INSERT INTO A_REPLY VALUES (SEQ_REPLY.NEXTVAL, 4, 'user04@email.com', '또 갈래? 내년에?', 0, TO_DATE('202407011005', 'YYYYMMDDHH24MISS'), 'Y');

--------------------------------------------------
--------------     커밋!!!	    ------------------	
--------------------------------------------------
COMMIT;
</pre>
    
</details>
