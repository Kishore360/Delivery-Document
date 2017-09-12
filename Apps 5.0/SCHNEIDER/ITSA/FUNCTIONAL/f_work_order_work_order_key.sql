SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order.work_order_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.f_work_order TRGT ON (SRC.work_order_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
jOIN schneider_mdwdb.d_work_order LKP ON (SRC.work_order_id = LKP.row_id  AND SRC.sourceinstance = LKP.source_id ) 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.work_order_id IS NULL THEN 0 else -1 end)  <> (TRGT.work_order_key) 
