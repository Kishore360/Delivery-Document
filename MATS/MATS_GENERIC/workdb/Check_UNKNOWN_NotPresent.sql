




SELECT CASE WHEN CntUnknown > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN CntUnknown > 0 THEN CONCAT('<<tenant>>_workdb.<<tablename>> has', CAST(CntUnknown AS CHAR(10)),' #COLUMN_NAME as -1 out of '
, CAST(CntTotal AS CHAR(10)),' records' ) 
ELSE '<<tenant>>_workdb.<<tablename>> has no #COLUMN_NAME -1' END AS Message
FROM (SELECT COUNT(1) CntUnknown 
FROM <<tenant>>_workdb.<<tablename>> 
WHERE #COLUMN_NAME = -1 AND row_id NOT IN ('UNKNOWN','UNSPECIFIED')) A
,(SELECT COUNT(1) CntTotal 
FROM <<tenant>>_workdb.<<tablename>>) B

