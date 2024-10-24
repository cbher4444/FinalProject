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
- 1. 회원가입 및 로그인 <br>
  로그인 기능 <br>
  - 아이디 찾기
  - 비밀번호 변경
  회원가입 기능<br>
  - 회원가입시 이메일 인증 (Gmail api)<br>
  - 회원가입시 주소 검색 (카카오주소API)
- 2. 채팅 기능<br>
  1대1 채팅 기능 <br>
  - websocket을 이용한 1대1 채팅
  1대1 화상통화 기능 <br>
  - WebRTC를 이용한 1대1 화상채팅 
- **이은지**

- **황영찬**
    - 앨범
        - 구글 포토에 등록된 앨범 가져오기 (구글 API)
        - 앨범 생성,사진 추가 / 삭제하기
        - 스토리(사진 게시판) 생성 및 댓글 기능
    - 활동 추천
    - 관리자 페이지
        - 회원 정보 조회

## 👊프로젝트 구현

### ❤ 김동규

#### 🔴 캘린더

##### 일정조회

> - 공휴일 가져오기 (Google Calendar API). // 빨간색 일정이 공휴일.
> - 화면구현 (FullCalendar JS Library)
> - 년/월/주/일/목록별 조회

![Calendar_view](https://github.com/user-attachments/assets/e849d7ff-b347-4041-a4bd-7040b351468d)


##### 일정 알림문자 발신

> Twilio API 사용

![Calendar_textAlert](https://github.com/user-attachments/assets/fe35bb2f-f878-4b1e-803a-309f88cecd92)

> 핸드폰 받은문자메시지

<img src="https://github.com/user-attachments/assets/a96ede5b-c8be-4d8f-a28b-1783c4f5a0c8" alt="sms message" width="400px">
<!-- ![Calendar_textAlert_result](https://github.com/user-attachments/assets/a96ede5b-c8be-4d8f-a28b-1783c4f5a0c8) -->


##### 일정 CRUD

> - 월/주/일/년별 View에서 일정 추가
> - 일정 수정/삭제

![Calendar_CRUD](https://github.com/user-attachments/assets/5d2d5ca4-1b74-4b9e-a4a7-0317cbd26f37)


##### 캘린더별 조회/수정

> - 모든일정 / 우리일정 / 내일정 / 상대방일정별 조회
> - 캘린더별 기본색상 변경

![Calendar_Cal ReadUpdate](https://github.com/user-attachments/assets/d101eed8-887f-48d6-86bf-565558dd8bc7)


#### 🔴 마인드맵

> - 화면구현 (Go JS Library)
> - 마인드맵 CRUD

![mindmap](https://github.com/user-attachments/assets/1c4bd257-2782-45a7-b87c-58405ddf029d)


#### 🔴 마이페이지

##### 초대코드 카카오톡 공유

> Kakao API 사용

![myPage_inviteCode_kakaoShare](https://github.com/user-attachments/assets/0ec7eb57-875f-4c99-9cd8-d8f371f236f6)


##### 탈퇴 30일 후 계정영구삭제

> DBMS Scheduler을 통한 자동화

![탈퇴30일후_계정영구삭제](https://github.com/user-attachments/assets/a604f0a6-e4b8-467c-93bc-93f03c9169ef)

<details>
<summary>계정 자동영구삭제 SQL문</summary>

    -- 탈퇴신청 30일 후 계정영구삭제, 안쓰는 커플코드 영구삭제. 매일 밤 12시에 실행됨 
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
    
</details>


##### 커플 등록/삭제

> 커플 등록

![myPage_couple_register](https://github.com/user-attachments/assets/87962db5-1f48-4c85-8894-d4de7084c268)

> 계정 삭제 & 커플 해제

![myPage_cancelAccount](https://github.com/user-attachments/assets/8ea8dc5b-92a0-4ce2-a522-9c630141c4a4)


##### 회원 조회/변경

![myPage_edit](https://github.com/user-attachments/assets/9fbcff9b-05ef-40da-a1d3-9e7377fa5486)


#### 🔴 홈 

##### 커플정보 조회/수정

![memberHome_edit](https://github.com/user-attachments/assets/13611d1f-c504-475c-a37a-ddfb039e5f91)

##### 로그인 전/후 화면구현

> 로그인 전

![guestHome](https://github.com/user-attachments/assets/9bd048f1-e3c6-4067-902f-3a4ca8d6bc18)

> 로그인 후
> - 만난지 몇일인지 D-DAY 카운트 기능 포함

![memberHome](https://github.com/user-attachments/assets/4a5d9caf-3682-4be0-aeb6-e479db097fc9)


### 🧡 이승헌

#### 🟠 로그인/회원가입

##### 회원가입

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
#### 🟢 메뉴명
#### 🟢 메뉴명
#### 🟢 메뉴명