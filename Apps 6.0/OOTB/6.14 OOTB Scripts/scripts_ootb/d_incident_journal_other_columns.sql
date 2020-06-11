select 
-- inc.sys_id,sj.value as work_notes
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_journal.task_attribute_wh_name/task_wh_type/soft_deleted_flag' ELSE 'SUCCESS' END as Message
 
 -- select TRGT.row_id,SRC.sys_id,coalesce(SRC.value,'') as SRC,coalesce(TRGT.work_notes,''),TRGT.incident_key,inc.incident_key
 from 
  #DWH_TABLE_SCHEMA.d_incident_journal TRGT
  where (task_attribute_wh_name<>'work_notes'
  or task_wh_type<>'incident'
  or soft_deleted_flag<>'N')
  and row_key not in  (0,-1)