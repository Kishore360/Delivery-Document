select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for changed_on from task_sla_final to f_task_sla' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_sla_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.f_task_sla DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where ifnull(convert_tz(S.sys_updated_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<> ifnull(DWH.changed_on,'');
