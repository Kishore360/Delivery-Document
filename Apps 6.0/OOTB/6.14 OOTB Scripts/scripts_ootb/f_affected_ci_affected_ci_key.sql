SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_affected_ci.affected_ci_key' ELSE 'SUCCESS' END as Message
from (select *from  #MDS_TABLE_SCHEMA.task_ci_final  where cdctype<>'D') SRC
--LEFT JOIN #MDS_TABLE_SCHEMA.cmdb_ci_final SRC1
--on SRC.ci_item=SRC1.sys_id
--and SRC.sourceinstance=SRC1.sourceinstance
left join  #DWH_TABLE_SCHEMA.f_affected_ci TRGT
on SRC.sys_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item d
on SRC.ci_item=d.row_id 
and SRC.sourceinstance=d.source_id
where coalesce(d.row_key,case when SRC.ci_item is null then 0 else -1 end)<>coalesce(TRGT.affected_ci_key,'');