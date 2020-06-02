SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_iteration.iteration_count' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, SRC.work_item_key, SRC.source_id,
  cast(COALESCE(SRC.business_value_burn,0) as decimal(28,10)) sr, COALESCE(TRGT.business_value_burn ,'') tg*/
FROM (
select SR.iteration_key, SR.row_id, SR.source_id, count(distinct SR.iteration_key) as iteration_count
from #STG_TABLE_SCHEMA.f_iteration_temp SR
group by SR.iteration_key, SR.row_id, SR.source_id
 ) SRC

LEFT JOIN #DWH_TABLE_SCHEMA.f_iteration TRGT 
ON (SRC.row_id = TRGT.row_id 
AND SRC.source_id=TRGT.source_id)
 
WHERE TRGT.soft_deleted_flag = 'N' and COALESCE(SRC.iteration_count,0) <> COALESCE(TRGT.iteration_count ,'');