SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message 
 FROM (SELECT count(1) as CNT 
 from 
#MDS_TABLE_SCHEMA.task_sla_final task_sla 
join #DWH_TABLE_SCHEMA.f_task_sla a on a.row_id=task_sla.sys_id and a.source_id=task_sla.sourceinstance
where 
convert_tz(task_sla.start_time,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <>a.start_on)temp; 

