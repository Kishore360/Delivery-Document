SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order.business_service_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC 
JOIN schneider_mdwdb.f_work_order TRGT ON (SRC.work_order_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id 
)  LEFT JOIN schneider_mdwdb.d_service LKP ON ( concat( 'BMC_BUSINESSSERVICE~' ,upper(SRC.ci_reconid)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.ci_reconid IS NULL THEN 0 else -1 end)<> (TRGT.business_service_key) 
