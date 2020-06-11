select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_response.question_key' else 'SUCCESS' end as Message
from 
(
select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_response_final WHERE CDCTYPE<>'D') S
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_instance_final WHERE CDCTYPE<>'D') si on S.instance = si.sys_id AND S.sourceinstance = si.sourceinstance 
left join #DWH_TABLE_SCHEMA.d_survey_question sur_ques on sur_ques.row_id =  S.question AND sur_ques.source_id = S.sourceinstance

left join #DWH_TABLE_SCHEMA.f_response DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where ifnull(case when S.question is null then 0 when S.question is not null and sur_ques.row_key is null then -1 else sur_ques.row_key end, '') <> ifnull(DWH.question_key,'')

union all

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_question_final WHERE CDCTYPE<>'D') A 
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_final WHERE CDCTYPE<>'D') B on (A.instance = B.sys_id) 
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') C on (B.metric_type = C.sys_id and C.evaluation_method = 'survey')
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_result_final WHERE CDCTYPE<>'D') D on (D.instance_question = A.sys_id)

left join #DWH_TABLE_SCHEMA.d_survey_question sur_ques on sur_ques.row_id = A.metric AND sur_ques.source_id = A.sourceinstance

left join #DWH_TABLE_SCHEMA.f_response DWH on DWH.row_id = A.sys_id 

where ifnull(case when A.metric is null then 0 when A.metric is not null and sur_ques.row_key is null then -1 else sur_ques.row_key end, '') <> ifnull(DWH.question_key,'')
)SQ;