SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_burn_down.committed_velocity_sp' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, SR.row_id, SR.iteration_key,
  COALESCE(SRC.committed_velocity_sp,0) sr, COALESCE(TRGT.committed_velocity_sp ,'') tg*/
FROM (
select SR.iteration_key, SR.row_id, SR.source_id, sum(case when SR.burn_date_key =  DATE_FORMAT(SR.iteration_start_date,'%Y%m%d') then round(SR.story_points_burn * (SR.is_added_count - SR.is_removed_count), 2) else 0 end) as committed_velocity_sp
from #STG_TABLE_SCHEMA.f_iteration_temp SR
group by SR.iteration_key, SR.row_id, SR.source_id
 ) SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_iteration TRGT 
ON (SRC.row_id = TRGT.row_id 
AND SRC.source_id=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.committed_velocity_sp,0.00) <> COALESCE(TRGT.committed_velocity_sp ,'');