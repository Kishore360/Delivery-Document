select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'All columns validation failed for incident_work_notes' ELSE 'SUCCESS' END as Message 
from
( 
select row_key,incident_key-- , task_wh_type
,soft_deleted_flag,source_id,etl_run_number,
 work_notes
from #DWH_TABLE_SCHEMA.d_incident_journal
where row_key not in (0,-1)
) src
left outer join 
(SELECT row_key, incident_key,soft_deleted_flag,source_id,etl_run_number,work_notes 
from #DWH_TABLE_SCHEMA.incident_work_notes) tgt
on src.row_key=tgt.row_key 
where 
coalesce(src.incident_key,'')<> coalesce(tgt.incident_key,'') and 
coalesce(src.soft_deleted_flag,'')<> coalesce(tgt.soft_deleted_flag,'') and 
coalesce(src.source_id,'') <> coalesce(tgt.source_id,'') and 
coalesce(src.etl_run_number,'') <> coalesce(tgt.etl_run_number,'')  and 
coalesce(src.work_notes,'') <> coalesce(tgt.work_notes,'')