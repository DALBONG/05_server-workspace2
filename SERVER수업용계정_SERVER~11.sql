-- ATTACHMENT¿¡ INSERT

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
     
SELECT *
  from board;