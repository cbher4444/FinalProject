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
        - 공휴일 가져오기 (Google API)
        - 화면구현 (FullCalendar JS Library)
        - 일정 문자알림서비스 (Twilio API)
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

- **김동규**

홈 (로그인 전)
![guestHome](https://github.com/user-attachments/assets/9bd048f1-e3c6-4067-902f-3a4ca8d6bc18)

- **이승헌**

회원가입 <br>
![회원가입 7mb](https://github.com/user-attachments/assets/c39e481a-6cd3-4466-b823-e341ea4206b2)<br>
로그인 기능<br>
(커플코드 없는 사람의 로그인)<br>
![커플코드없는사람 마이페이지](https://github.com/user-attachments/assets/e221204c-4007-4df2-89eb-0db56026b425)<br>
(커플코드 있는 사람의 로그인)<br>
![커플코드있는아이디 로그인](https://github.com/user-attachments/assets/f9a61c47-9985-4888-8972-13cfd08887ef)<br>
아이디 찾기<br>
![아이디 찾기](https://github.com/user-attachments/assets/3301ad98-e8c9-4a04-8f5b-c06c965b402a)<br>
비밀번호 찾기<br>
![비밀번호 찾기 및 변경](https://github.com/user-attachments/assets/02d3cd40-68ce-417c-971f-4f573a20c3ba)<br>
 1대 1 채팅<br>

![채팅기능](https://github.com/user-attachments/assets/8e48e5f1-cdd0-474c-a3c3-43f22f0ceac5)<br>
 1 대 1 화상채팅 <br>
화상통화 <br>
![화상통화 다시만듬](https://github.com/user-attachments/assets/2b804ecb-7062-47fc-93a3-675d3b1e6a6b)<br>

- **이은지**

- **황영찬**