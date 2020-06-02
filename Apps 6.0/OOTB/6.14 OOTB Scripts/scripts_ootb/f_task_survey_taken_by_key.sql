select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed for taken_by_key between task_survey_final and f_task_survey' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_survey_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.d_internal_contact DPV
on (DPV.row_id  = concat('INTERNAL_CONTACT~',S.sent_to) and DPV.source_id  = S.sourceinstance)

left join #DWH_TABLE_SCHEMA.d_internal_contact DPV_TKN
on (DPV_TKN.row_id  = concat('INTERNAL_CONTACT~',S.taken_by) and DPV_TKN.source_id  = S.sourceinstance)

left join #DWH_TABLE_SCHEMA.f_task_survey DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where ifnull(case when S.state ='requested' then DPV.row_key else DPV_TKN.row_key end,
case when case when S.state ='requested' then S.sent_to else S.taken_by end is not null then -1 else 0 end) <> ifnull(DWH.taken_by_key,'');