SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_iteration.stories_added' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, SR.row_id, SR.iteration_key,
  COALESCE(SRC.stories_added,0) sr, COALESCE(TRGT.stories_added ,'') tg*/
FROM (
select SR.iteration_key, SR.row_id, SR.source_id, sum(case when SR.wi_typ = 'STORY' then (SR.is_added_count - SR.is_removed_count) else 0 end) as stories_added
from #STG_TABLE_SCHEMA.f_iteration_temp SR
group by SR.iteration_key, SR.row_id, SR.source_id
 ) SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_iteration TRGT 
ON (SRC.row_id = TRGT.row_id 
AND SRC.source_id=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.stories_added,0) <> COALESCE(TRGT.stories_added ,'');