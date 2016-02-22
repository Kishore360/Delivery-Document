

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.not_on_time_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE (CASE WHEN SRC.ACTIVE = 1 && ((SRC.closed_at) > (SRC.end_date)) THEN 'Y' ELSE 'N' END )<> (TRGT.not_on_time_flag )
-- To remove the ACTIVE Condition from 3.0 Release 
 
