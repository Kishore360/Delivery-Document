select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed for created_on between task_survey_final and f_task_survey' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_survey_final WHERE CDCTYPE<>'D') S
left join #DWH_TABLE_SCHEMA.f_task_survey DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where ifnull(convert_tz(S.sys_created_on,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'') <> ifnull(DWH.created_on,'');
