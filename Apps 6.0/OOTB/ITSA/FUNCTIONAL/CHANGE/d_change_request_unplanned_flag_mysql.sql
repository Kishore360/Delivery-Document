SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.unplanned_flag' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE TRGT.soft_deleted_flag='N'and  CASE WHEN  SRC.`type` = 'Emergency' OR SRC.start_date IS NULL THEN 'Y' ELSE 'N' END<> TRGT.unplanned_flag)temp;
