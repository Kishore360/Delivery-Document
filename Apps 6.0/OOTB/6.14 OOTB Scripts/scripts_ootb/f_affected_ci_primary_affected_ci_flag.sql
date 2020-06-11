SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_affected_ci.primary_affected_ci_flag'
ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.task_ci_final  where cdctype<>'D') SRC
left join #MDS_TABLE_SCHEMA.task_final SRC1
on SRC.task=SRC1.sys_id
and SRC.sourceinstance=SRC1.sourceinstance
left join  #DWH_TABLE_SCHEMA.f_affected_ci TRGT
on SRC.sys_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(case when SRC.ci_item = SRC1.cmdb_ci then 'Y' else 'N' end,'')<>coalesce(TRGT.primary_affected_ci_flag,'');