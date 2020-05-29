select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed for requested_on_key between task_survey_final and f_task_survey' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_survey_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.d_calendar_date DCD_REQ
on (DCD_REQ.row_id  = date_format(convert_tz(S.requested_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') 
and DCD_REQ.source_id  =0)

left join #DWH_TABLE_SCHEMA.f_task_survey DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where ifnull(DCD_REQ.row_key,case when S.requested_date is not null then '' else '' end) <> ifnull(DWH.requested_on_key,'');
