SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_burn_down.completed_velocity_sp' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, SR.row_id, SR.iteration_key,
  COALESCE(SRC.completed_velocity_sp,0) sr, COALESCE(TRGT.completed_velocity_sp ,'') tg*/
FROM (
select SR.iteration_key, SR.row_id, SR.source_id, sum(round(SR.story_points_burn * (SR.is_resolved_count - SR.is_reopened_count), 2)) as completed_velocity_sp
from #STG_TABLE_SCHEMA.f_iteration_temp SR
group by SR.iteration_key, SR.row_id, SR.source_id
 ) SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_iteration TRGT 
ON (SRC.row_id = TRGT.row_id 
AND SRC.source_id=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.completed_velocity_sp,0.00) <> COALESCE(TRGT.completed_velocity_sp ,'');