SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_category_key' ELSE 'SUCCESS' END as Message 
FROM  schneider_mdsdb.slm_servicetarget_final SRC
JOIN  schneider_mdwdb.d_task_sla TRGT 
on SRC.instanceid=TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
left join schneider_mdwdb.d_lov lov
on lov.dimension_class = 'NAME~TASK_SLA' AND locate(lov.dimension_code,TRGT.sla_name) <> 0 
where TRGT.sla_category_key <> if(TRGT.sla_name is null,0,coalesce(lov.row_key,-1))

