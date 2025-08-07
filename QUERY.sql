-- 로그인 요청시 실행될 sql문 
SELECT 
       USER_NO
     , USER_ID
     , USER_PWD
     , USER_NAME
     , PHONE
     , EMAIL
     , ADDRESS
     , INTEREST
     , ENROLL_DATE
     , MODIFY_DATE
     , STATUS
  FROM MEMBER
 WHERE USER_ID = ?
   AND USER_PWD = ?
   AND STATUS = 'Y';
   
-- 회원가입 요청시 실행할 SQL문
INSERT 
  INTO MEMBER 
     (
       USER_NO
     , USER_ID
     , USER_PWD
     , USER_NAME
     , PHONE
     , EMAIL
     , ADDRESS
     , INTEREST
     )
VALUES
    (
       SEQ_UNO.NEXTVAL
     , ?
     , ?
     , ?
     , ?
     , ?
     , ?
     , ?
    );
 
UPDATE MEMBER
   SET USER_NAME = ?
     , PHONE = ?
     , EMAIL = ?
     , ADDRESS = ?
     , INTEREST = ?
     , MODIFY_DATE = SYSDATE
 WHERE USER_ID = ?;

 
UPDATE MEMBER 
   SET USER_PWD = ?
     , MODIFY_DATE = SYSDATE
 WHERE USER_ID = ?
   AND USER_PWD = ?;


SELECT 
       NOTICE_NO
     , NOTICE_TITLE
     , USER_ID
     , COUNT
     , CREATE_DATE
  FROM NOTICE N
  JOIN MEMBER M ON N.NOTICE_WRITER = M.USER_NO
 WHERE N.STATUS = 'Y'
 ORDER 
    BY NOTICE_NO DESC;
    
INSERT 
  INTO NOTICE
     (
       NOTICE_NO
     , NOTICE_TITLE
     , NOTICE_CONTENT
     , NOTICE_WRITER
     )
VALUES
    (
       SEQ_NNO.NEXTVAL
     , ?
     , ?
     , 로그인한 사용자의 유저 넘버 
    ) ;
    
    
    
UPDATE
       NOTICE
   SET COUNT = COUNT + 1
 WHERE NOTICE_NO = 조회하고자 하는 글번호
   AND STATUS = 'Y';
   

SELECT 
       NOTICE_NO
     , NOTICE_TITLE
     , NOTICE_CONTENT
     , USER_ID
     , CREATE_DATE
  FROM NOTICE
  JOIN MEMBER ON NOTICE_WRITER = USER_NO
 WHERE NOTICE_NO = ?
 
 
UPDATE
       NOTICE
   SET NOTICE_TITLE = 입력 제목
     , NOTICE_CONTENT = 입력 내용
 WHERE NOTICE_NO = 수정하려는 글 번호;
 
 SELECT *   
FROM MEMBER;

SELECT *
FROM BOARD;


UPDATE
       NOTICE
  JOIN MEMBER ON NOTICE_WRITER = USER_NO
   SET NOTICE_TITLE
     , USER_NO
     , COUNT
     , CREATE_DATE
 WHERE NOTICE_NO = 삭제하려는 글 번호;
 
 
SELECT 
       COUNT(*) AS "COUNT"
  FROM BOARD
 WHERE BOARD_TYPE = 1
   AND STATUS = 'Y';
   
   
   
	SELECT *
	  FROM (
	        SELECT ROWNUM RNUM, A.*
	          FROM (
	                SELECT 
	                       BOARD_NO
	                     , CATEGORY_NAME
	                     , BOARD_TITLE
	                     , USER_ID
	                     , COUNT
	                     , TO_CHAR(CREATE_DATE, 'YYYY/MM/DD') "CREATE_DATE"
	                  FROM BOARD B
	                  JOIN CATEGORY USING (CATEGORY_NO)
	                  JOIN MEMBER ON (BOARD_WRITER = USER_NO)
	                 WHERE BOARD_TYPE = 1
	                   AND B.STATUS = 'Y'
	                 ORDER 
	                    BY BOARD_NO DESC
	                ) A
	        )
	 WHERE RNUM BETWEEN 1 AND 11;

SELECT 
       CATEGORY_NO
     , CATEGORY_NAME
  FROM CATEGORY;