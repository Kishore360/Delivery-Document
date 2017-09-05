SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order_task.age_key' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.tms_task_final  SRC JOIN schneider_mdwdb.f_work_order_task TRGT 
ON (SRC.task_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  LEFT JOIN schneider_mdwdb.d_lov LKP
LEFT JOIN schneider_mdwdb.d_lov LKP  
ON ((TRGT.age div 86400.0 BETWEEN LKP.lower_range_value AND LKP.upper_range_value)
AND LKP.dimension_class = 'AGEBUCKET_WH~WORK_ORDER_TASK' )
WHERE (LKP.row_key )  <> TRGT.age_key)b; 