 SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_key' ELSE 'SUCCESS' END as Message 
 from schneider_mdsdb.slm_measurement_final src 
join schneider_mdwdb.f_task_sla stg on stg.row_id= src.instanceid and stg.source_id=src.sourceinstance
join schneider_mdwdb.d_task_sla stg1 on stg1.row_id= src.svtinstanceid  and stg1.source_id=src.sourceinstance
where stg.sla_key <> coalesce(stg1.row_key,case when stg1.row_key is null then 0 else -1 end)




