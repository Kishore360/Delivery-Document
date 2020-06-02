SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task.overdue_duration' ELSE 'SUCCESS' END as Message
from 
(
select row_id,overdue_duration,source_id from #DWH_TABLE_SCHEMA.f_incident inc union all		
select row_id,overdue_duration,source_id from #DWH_TABLE_SCHEMA.f_problem prob union all
select row_id,overdue_duration,source_id from #DWH_TABLE_SCHEMA.f_request req union all
select row_id,overdue_duration,source_id from #DWH_TABLE_SCHEMA.f_problem_task prob_tas union all
select row_id,overdue_duration,source_id from #DWH_TABLE_SCHEMA.f_change_task chang_tas union all
select row_id,overdue_duration,source_id from #DWH_TABLE_SCHEMA.f_change_request chang_req union all
select row_id,overdue_duration,source_id from #DWH_TABLE_SCHEMA.f_request_item chang_tas 
) SRC
left outer join  #DWH_TABLE_SCHEMA.f_task tgt 
on SRC.row_id=tgt.row_id and SRC.source_id=tgt.source_id
where coalesce(SRC.overdue_duration,0) <> coalesce(tgt.overdue_duration,0)