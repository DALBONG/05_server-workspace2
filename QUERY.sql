-- �α��� ��û�� ����� sql�� 
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
   
-- ȸ������ ��û�� ������ SQL��
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
     , �α����� ������� ���� �ѹ� 
    ) ;
    
    
    
UPDATE
       NOTICE
   SET COUNT = COUNT + 1
 WHERE NOTICE_NO = ��ȸ�ϰ��� �ϴ� �۹�ȣ
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
   SET NOTICE_TITLE = �Է� ����
     , NOTICE_CONTENT = �Է� ����
 WHERE NOTICE_NO = �����Ϸ��� �� ��ȣ;
 
 SELECT *   
FROM MEMBER;

SELECT *
FROM NOTICE;


UPDATE
       NOTICE
  JOIN MEMBER ON NOTICE_WRITER = USER_NO
   SET NOTICE_TITLE
     , USER_NO
     , COUNT
     , CREATE_DATE
 WHERE NOTICE_NO = �����Ϸ��� �� ��ȣ;
 
 
SELECT 
       COUNT(*) AS "COUNT"
  FROM BOARD
 WHERE BOARD_TYPE = 1
   AND STATUS = 'Y';