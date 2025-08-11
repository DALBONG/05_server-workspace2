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
     , ? 
    ) ;
    
    
    
UPDATE
       NOTICE
   SET COUNT = COUNT + 1
 WHERE NOTICE_NO = ?
   AND STATUS = 'Y';
   

SELECT 
       NOTICE_NO
     , NOTICE_TITLE
     , NOTICE_CONTENT
     , USER_ID
     , CREATE_DATE
  FROM NOTICE
  JOIN MEMBER ON NOTICE_WRITER = USER_NO
 WHERE NOTICE_NO = ?;
 
 
UPDATE
       NOTICE
   SET NOTICE_TITLE = ?
     , NOTICE_CONTENT = ?
 WHERE NOTICE_NO = ?;
 
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
 WHERE NOTICE_NO = �����Ϸ��� �� ��ȣ;
 
 
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
  
  
  
  
INSERT 
  INTO BOARD
    (
       BOARD_NO
     , BOARD_TYPE
     , CATEGORY_NO
     , BOARD_TITLE
     , BOARD_CONTENT
     , BOARD_WRITER
     )
     VALUES
     (
       SEQ_BNO.NEXTVAL
     , 1
     , ?
     , ?
     , ?
     , ?
     );
     
select *
FROM BOARD;

-- ATTACHMENT�� INSERT

INSERT
  INTO ATTACHMENT
  (
       FILE_NO
     , REF_BNO
     , ORIGIN_NAME
     , CHANGE_NAME
     , FILE_PATH
     )
     VALUES
     (
       SEQ_FNO.NEXTVAL
     , SEQ_BNO.CURRVAL
     , ?
     , ?
     , ?
     );


-- �� ��ȸ ��û
-- ��ȸ�� ������

UPDATE BOARD
   SET COUNT = COUNT +1
 WHERE BOARD_NO = ?
   AND STATUS = 'Y' ;
   
-- �Խñ� ���� ��ȸ
SELECT 
        BOARD_NO
      , CATEGORY_NAME
      , BOARD_TITLE
      , BOARD_CONTENT
      , USER_ID
      , TO_CHAR(CREATE_DATE, 'YYYY/MM/DD') "CREATE_DATE"
   FROM BOARD
   JOIN CATEGORY USING (CATEGORY_NO)
   JOIN MEMBER ON (BOARD_WRITER = USER_NO)
  WHERE BOARD_NO = ? ;
  
--÷������ ��ȸ
SELECT 
        FILE_NO
      , ORIGIN_NAME
      , CHANGE_NAME
      , FILE_PATH
   FROM ATTACHMENT
  WHERE REF_BNO = ? ;


-- ÷�������� �ֵ� ���� ���������� ������ Sql��
UPDATE BOARD
   SET 
       CATEGORY_NO = ?
     , BOARD_TITLE = ?
     , BOARD_CONTENT = ?
 WHERE BOARD_NO = ? ;
 
-- ÷�������� �ִ� ��� CASE 1.(���� ÷�������� �־�������
    -- ���ο� ÷�������� �Ѿ���� ���)
    --> UPDATE ATTACHMENT
UPDATE ATTACHMENT
   SET ORIGIN_NAME = ? -- �� ������ ������
     , CHANGE_NAME = ?  -- �� ������ ������
     , FILE_PATH = ? -- �� ������ �������
 WHERE FILE_NO = ? -- ���� ���� ��ȣ


-- ÷�������� �ִ� ��� CASE 2.(���� ÷�������� �����µ�,
    -- ���ο� ÷�������� �Ѿ���� ���) 
    -- INSERT ATTACHMENT 
INSERT 
  INTO ATTACHMENT
    ( 
       FILE_NO
     , REF_BNO
     , ORIGIN_NAME
     , CHANGE_NAME
     , FILE_PATH 
     )
  VALUES
    (
       SEQ_FNO.NEXTVAL
     , REF_BNO -- ���� �����ϰ� �ִ� �Խñ� ��ȣ
     , ?  -- ���ο� ������ ������
     , ?  -- ���ο� ������ ������
     , ?  -- ���ο� ������ ������
     )  ;
     
     
--========= �����==========-
-- ���� �Խñ� �ۼ� ��û�� ������ Sql��
INSERT 
  INTO BOARD
  (
       BOARD_NO
     , BOARD_TYPE
     , BOARD_TITLE
     , BOARD_CONTENT
     , BOARD_WRITER
  )
  VALUES
  (
       SEQ_BNO.NEXTVAL
     , 2
     , ? -- ����ڰ� �Է��� ����
     , ? -- ����ڰ� �Է��� ����
     , ? -- �α����� ȸ����ȣ
  );
  
-- INSEST ATTACHMENT (÷������ ������ŭ �ݺ��� ����)
INSERT
  INTO ATTACHMENT
  (
       FILE_NO
     , REF_BNO
     , ORIGIN_NAME
     , CHANGE_NAME
     , FILE_PATH
     , FILE_LEVEL
  )
  VALUES
  (
       SEQ_FNO.NEXTVAL
     , SEQ_BNO.CURRVAL
     , ? -- ÷������ ������
     , ? -- ÷������ ������
     , ? -- ������
     , ? -- ��ǥ�̹��� 1, ���̹��� 2  
  )

SELECT *
  FROM BOARD
 WHERE BOARD_TYPE = 2;

SELECT *
 FROM ATTACHMENT;
 
 
SELECT 
       BOARD_NO
     , BOARD_TITLE
     , COUNT
     , FILE_PATH || CHANGE_NAME AS "TITLEIMAGE"
  FROM BOARD B
  JOIN ATTACHMENT ON (BOARD_NO = REF_BNO)
 WHERE BOARD_TYPE = 2
   AND B.STATUS = 'Y'
   AND FILE_LEVEL = 1
 ORDER
    BY BOARD_NO DESC;

select *
 from board;
 
SELECT 
       BOARD_NO
     , BOARD_TITLE
     , USER_ID
     , TO_CHAR(CREATE_DATE, 'YYYY/MM/DD') AS "CREATE_DATE"
     , BOARD_CONTENT
  FROM BOARD B
  JOIN MEMBER M ON (B.BOARD_WRITER = M.USER_NO)
 WHERE B.BOARD_NO = ? ; 
  
  SELECT *
    FROM ATTACHMENT;
