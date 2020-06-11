insert into #STG_TABLE_SCHEMA.burn_down_temp
(sys_id, source_id, iteration_id, burn_on_key, started_on_key, work_item_id, work_item_key, 
 changed_on, changed_by, created_by, created_on, cdctype, soft_deleted_flag, inserted_on,
 is_added_count, is_removed_count, is_resolved_count, is_reopened_count)


select SQ.sys_id, SQ.source_id, SQ.iteration_id, SQ.burn_on_key, SQ.started_on_key, SQ.work_item_id, SQ.work_item_key, SQ.changed_on, SQ.changed_by, 
SQ.created_by, SQ.created_on, SQ.cdctype, SQ.soft_deleted_flag,current_timestamp,
  
sum(SQ.is_added) is_added_count, sum(SQ.is_removed) is_removed_count, sum(SQ.is_resolved) is_resolved_count, sum(SQ.is_reopened) is_reopened_count

from (
select concat(DIT.row_id,'~',CAL.row_key,'~0') sys_id, 
DIT.row_id iteration_id, CAL.row_key as burn_on_key, CAL.row_key as started_on_key, 0 work_item_id, DIT.source_id, 0 as work_item_key, DIT.changed_on as changed_on, DIT.changed_by as changed_by, 
DIT.created_by as created_by, DIT.created_on as created_on, DIT.cdctype cdctype, DIT.soft_deleted_flag,

0 AS is_added,
0 AS is_removed,
0 AS is_reopened,
0 AS is_resolved  

FROM #DWH_TABLE_SCHEMA.d_iteration DIT      
JOIN #DWH_TABLE_SCHEMA.d_calendar_date CAL 
ON CAL.calendar_date BETWEEN DATE(DIT.start_date)  AND 
DATE(coalesce(DIT.completion_date, DIT.end_date)) AND DIT.row_key>0 
LEFT JOIN #STG_TABLE_SCHEMA.burn_down_temp burn_down 
ON DIT.row_id = burn_down.iteration_id and DIT.source_id = burn_down.source_id
AND CAL.row_key=burn_down.burn_on_key  
AND burn_down.work_item_key <> 0
WHERE burn_down.sys_id is null
) SQ
group by SQ.sys_id;

use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.burn_down_temp temp_removed
join #STG_TABLE_SCHEMA.burn_down_temp temp_resolved
on temp_removed.work_item_key = temp_resolved.work_item_key
and temp_removed.iteration_id = temp_resolved.iteration_id
and temp_removed.source_id = temp_resolved.source_id
and temp_removed.is_removed_count > 0
and temp_resolved.is_resolved_count > 0
set temp_removed.is_removed_count = 0
where temp_removed.burn_on_key >= temp_resolved.burn_on_key;