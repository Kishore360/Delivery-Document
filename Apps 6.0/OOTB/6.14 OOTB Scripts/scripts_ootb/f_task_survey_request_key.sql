select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed for request_key between task_survey_final and f_task_survey' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_survey_final WHERE CDCTYPE<>'D') S
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') TF on (TF.sys_id  = S.task and TF.sourceinstance  = S.sourceinstance )

left join #DWH_TABLE_SCHEMA.d_request REQ
on (REQ.row_id  = S.task  and upper(TF.sys_class_name) in ('REQUEST', 'SC_REQUEST') and REQ.source_id  = S.sourceinstance )

left join #DWH_TABLE_SCHEMA.f_task_survey DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where ifnull(REQ.row_key,case when upper(TF.sys_class_name)in ('REQUEST', 'SC_REQUEST') then -1 else 0 end) <> ifnull(DWH.request_key,'');
