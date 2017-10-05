SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  
THEN 'MDS to DWH data validation failed for f_work_order.work_order_status_reason_key' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.d_work_order TRGT ON 
(SRC.request_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN schneider_mdwdb.d_lov LKP ON ( COALESCE(CONCAT('STATUS_REASON~WORK_ORDER~~~',  upper( SRC.status_reason))) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.status_reason IS NULL THEN 0 else -1 end)<> (TRGT.work_order_status_reason_key) 



