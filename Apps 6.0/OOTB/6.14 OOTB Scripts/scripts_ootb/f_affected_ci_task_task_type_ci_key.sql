SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_affected_ci.task_task_type_ci_key' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.task_ci_final  where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_task d
on SRC.task=d.row_id
and SRC.sourceinstance=d.source_id
left join #DWH_TABLE_SCHEMA.d_lov lov
on CONCAT('TASK_TYPE~TASK~',upper(d.task_type_src_code ))=lov.row_id
and SRC.sourceinstance=lov.source_id
left join  #DWH_TABLE_SCHEMA.f_affected_ci TRGT
on SRC.sys_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(lov.row_key,case when d.task_type_src_code is null then 0 else -1 end)
<>coalesce(TRGT.task_task_type_ci_key,'');