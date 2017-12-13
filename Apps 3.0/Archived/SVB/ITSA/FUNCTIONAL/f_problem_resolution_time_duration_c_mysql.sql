SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.business_duration' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM svb_mdsdb.problem_final SRC
 LEFT JOIN svb_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.u_resolution_time)<>  COALESCE(TRGT.resolution_time_duration_c,''))temp;
 
