

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.total_actual_loc_cost' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.pm_project_task_final SRC 
 LEFT JOIN <<tenant>>_mdsdb.fx_currency_instance_final FI
 ON(FI.id=SRC.sys_id and FI.field='work_cost')
 LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CAST(FI.amount as decimal(20,10)),'')<> COALESCE(TRGT.total_actual_loc_cost ,'')
 
