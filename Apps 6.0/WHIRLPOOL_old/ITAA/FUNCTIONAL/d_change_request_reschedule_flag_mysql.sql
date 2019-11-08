
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.rescheduled_flag' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.change_request_final SRC
 LEFT JOIN whirlpool_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where (case when SRC.u_rescheduled_change=1  then 'Y' else 'N' end) <>(TRGT.rescheduled_flag)