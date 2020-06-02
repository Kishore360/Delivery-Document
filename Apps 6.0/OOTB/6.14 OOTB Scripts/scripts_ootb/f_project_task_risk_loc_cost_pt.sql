

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.risk_loc_cost' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ( select * from #MDS_TABLE_SCHEMA.fx_currency_instance_final where (id, sys_created_on,field) in ( select id, max(sys_created_on),field from #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D' and field='risk_cost' and (id is not null) group by id, sys_created_on,field)) FEI
 ON(FEI.id=SRC.sys_id and FEI.field='risk_cost')
 LEFT JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE CAST(COALESCE(FEI.amount,0) as decimal(20,10))<> COALESCE(TRGT.risk_loc_cost ,'')
