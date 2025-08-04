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
   
SELECT *   
FROM MEMBER;