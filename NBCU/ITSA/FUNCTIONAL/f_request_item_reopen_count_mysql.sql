SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.reopened_count_c' ELSE 'SUCCESS' END as Message
FROM nbcu_mdsdb.sc_request_item_final SRC 
 JOIN nbcu_mdwdb.f_request_item TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE( SRC.u_reopen_count,'')<> COALESCE(TRGT.reopened_count_c ,'') ;
