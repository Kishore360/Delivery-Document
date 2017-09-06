SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order_task.business_service_key' ELSE 'SUCCESS' END as Message FROM <<tenant>>_mdsdb.tms_task_final  SRC JOIN <<tenant>>_mdwdb.f_work_order_task TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN <<tenant>>_mdwdb.d_configuration_item LKP ON ( concat( 'BUSINESS_SERVICE~' ,upper( SRC.serviceci)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) WHERE COALESCE(LKP.row_key,CASE WHEN SRC.serviceci IS NULL THEN 0 else -1 end)<> (TRGT.business_service_key) 
