select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed for survey_instance_key between task_survey_final and f_task_survey' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_survey_final WHERE CDCTYPE<>'D') S
left join #DWH_TABLE_SCHEMA.d_survey_instance DSI
on (DSI.row_id  = S.instance and DSI.source_id  = S.sourceinstance)

left join #DWH_TABLE_SCHEMA.f_task_survey DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where coalesce(DSI.row_key,case when S.instance is not null then -1 else 0 end) <> ifnull(DWH.survey_instance_key,'')
