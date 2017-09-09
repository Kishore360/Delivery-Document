SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order.work_order_state_key' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.d_work_order TRGT on	 
(SRC.work_order_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id  ) LEFT JOIN schneider_mdwdb.d_lov LKP 
ON ( concat( 'STATE~WORK_ORDER~~~' ,upper( SRC.status)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.status IS NULL THEN 0 else -1 end)<> (TRGT.work_order_state_key) 
