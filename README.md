# 풋살 매칭 웹 사이트
![개인](https://user-images.githubusercontent.com/59239079/79235325-6c9b2800-7ea6-11ea-8ef1-f19acba845bb.png)
- Spring Framework 기반 mvc2 패턴을 이용하여 웹페이지를 구현하였습니다. Apache Tomcat9을 통하여 서버를 구동하였고, mybats를 이용해서 oracle db를 연동 하였습니다. HTML, CSS, JAVASCRIPT, AJAX를 이용해서 전체적인 UI,UX를 만들었습니다. 
## 개발환경
- OS
    - windows

- Back-End
    - JDK 1.8
    - Java 8
    - Tomcat Server 9
    - Springframework
    - Mybatis
    - Oracle
    - Open API
    - Restful API
    
- Front End
    - Ajax
    - javascript
    - html
    - css
    
 ## 개발 배경
 - 평소 풋살을 좋아하지만 인원이 없어서 못하는 경우가 많았습니다. 그래서 풋살 매칭을 도와주는 웹사이트를 만들어서 혼자서도 쉽게 풋살을 즐길 수 있도록 하고자 만들어보게 되었습니다.
 
 ## 기능
 - 회원가입
 - 로그인, 로그아웃
 - id, pw 찾기
 - 회원 정보 수정 및 탈퇴
 - 회원 사진 추가 및 수정, 삭제
 - 용병 모집 게시판 CRUD
 - 용병 신청 게시판 CRUD
 - 매치 신청 게시판 CRUD
 - 카카오 지도 API를 이용한 위치 정보 표시
 - 게시판 댓글 기능
 - 게시판 검색 기능
 - 댓글 추천 비추천 

## 테이블
 - BOARD : 공지사항, 경기결과, 블랙리스트와 관련된 게시글을 관리하는 테이블     
 - BOARD_UPLOAD : BOARD 테이블의 첨부 파일 관리하는 테이블
 - BOARD_CATEGORY : 여러가지 게시판의 카테고리를 분류하기 위한 테이블
 - BOARD_VOTE : BOARD 테이블에서 댓글 선호도 내역을 관리하기 위한 테이블
 - MEMBER : 회원관리를 위한 테이블
 - BOARD2 : 용병 모집에 관한 게시글을 관리하는 테이블
 - BOARD3 : 용병 신청에 관한 게시글을 관리하는 테이블
 - BOARD4 : 매치 등록에 관한 게시글을 관리하는 테이블
 - RBOARD : BOARD 테이블의 댓글을 관리하는 테이블
 - RBOARD2 : BOARD2 테이블의 댓글을 관리하는 테이블
 - RBOARD3 : BOARD4 테이블의 댓글을 관리하는 테이블
 
## 주요 테이블 ERD
- 주요 테이블 간의 관계를 표시해보았습니다.

![K-002](https://user-images.githubusercontent.com/59239079/79252639-ee964b80-7ebc-11ea-959c-1507a2d3585b.png)

## 아키텍처 설계
- 풋살 매칭 사이트 HELLO FOOT BALL의 전체 아키텍처 설계도 입니다.
![K-001](https://user-images.githubusercontent.com/59239079/79252783-21404400-7ebd-11ea-94d8-be5c085e7f40.png)



## Demo
- [실행 영상](https://www.youtube.com/watch?v=BUMVqDi9BEk)
