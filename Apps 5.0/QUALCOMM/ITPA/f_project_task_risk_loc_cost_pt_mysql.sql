

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.risk_loc_cost' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.pm_project_task_final SRC 
 LEFT JOIN qualcomm_mdsdb.fx_currency_instance_final FEI
 ON(FEI.id=SRC.sys_id and FEI.field='risk_cost')
 LEFT JOIN qualcomm_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE CAST(COALESCE(FEI.amount,0) as decimal(20,10))<> COALESCE(TRGT.risk_loc_cost ,'')
