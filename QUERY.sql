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
   
SELECT *   
FROM MEMBER;

SELECT *
FROM NOTICE;

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
    )  