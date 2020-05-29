
-- actual
select row_key,incident_key -- , task_wh_type
,soft_deleted_flag,source_id,etl_run_number,
work_notes
from (select row_key,incident_key-- , task_wh_type
,soft_deleted_flag,source_id,etl_run_number,
 work_notes
from #DWH_TABLE_SCHEMA.d_incident_journal
where row_key not in (0,-1)
) S
order by row_key,incident_key-- , task_wh_type
,soft_deleted_flag,source_id,etl_run_number,
work_notes;
