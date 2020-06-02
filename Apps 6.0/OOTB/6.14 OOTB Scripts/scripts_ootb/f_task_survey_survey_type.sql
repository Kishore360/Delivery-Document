select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_task_survey.survey_type' else 'SUCCESS' end as Message
from 
(
select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_survey_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.f_task_survey DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where ifnull('LEGACY','') <> ifnull(DWH.survey_type,'')

union all

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_final WHERE CDCTYPE<>'D') A 
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') B on (A.metric_type = B.sys_id and B.evaluation_method = 'survey') 
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') C ON (A.trigger_id = C.sys_id) 
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_final WHERE CDCTYPE<>'D') D on (D.sys_id =A.user)

left join #DWH_TABLE_SCHEMA.f_task_survey DWH on DWH.row_id = A.sys_id and DWH.source_id = A.sourceinstance

where ifnull('ASSESSMENT','') <> ifnull(DWH.survey_type,'')
)SQ;