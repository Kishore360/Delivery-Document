

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.change_request_number' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE TRGT.soft_deleted_flag='N'and COALESCE( SRC.number,'')<> COALESCE(TRGT.change_request_number ,''))temp;
