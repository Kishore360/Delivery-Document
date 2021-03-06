
SELECT
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.rescheduled_flag' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

  JOIN <<tenant>>_mdwdb.f_change_request TRGT1 

ON (SRC.sys_id =TRGT1.row_id  
 AND SRC.sourceinstance= TRGT1.source_id  )  
where (case when TRGT1.reschedule_count>0  then 'Y' else 'N' end) <>(TRGT.rescheduled_flag))temp;