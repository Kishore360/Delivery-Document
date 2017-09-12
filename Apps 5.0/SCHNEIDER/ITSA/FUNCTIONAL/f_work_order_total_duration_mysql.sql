SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_work_order.total_duration' ELSE 'SUCCESS' END as Message FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.f_work_order TRGT ON (SRC.work_order_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )  WHERE 
  (case when (SRC.actual_end_date - SRC.actual_start_date ) < 0 then null 
 else (SRC.actual_end_date - SRC.actual_start_date ) end )  <> TRGT.total_duration




