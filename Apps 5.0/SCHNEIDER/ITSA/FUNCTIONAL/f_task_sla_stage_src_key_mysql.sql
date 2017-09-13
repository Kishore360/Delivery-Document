


SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_category_key' ELSE 'SUCCESS' END as Message 
 from schneider_mdsdb.slm_measurement_final src 
join schneider_mdwdb.f_task_sla stg on stg.row_id= src.instanceid and stg.source_id=src.sourceinstance
join schneider_mdwdb.d_lov stg1 on stg1.row_id= COALESCE(CONCAT('STAGE','~','TASK_SLA','~','~','~',UPPER(src.measurementstatus)),'UNSPECIFIED')  
and stg1.source_id=src.sourceinstance
where stg.stage_src_key<>coalesce(stg1.row_key,case when src.measurementstatus is null then 0 else -1 end)


