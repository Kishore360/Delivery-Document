SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_affected_ci.changed_on' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.task_ci_final  where cdctype<>'D') SRC
left join  #DWH_TABLE_SCHEMA.f_affected_ci TRGT
on SRC.sys_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(convert_tz(SRC.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>
coalesce(TRGT.changed_on,'');