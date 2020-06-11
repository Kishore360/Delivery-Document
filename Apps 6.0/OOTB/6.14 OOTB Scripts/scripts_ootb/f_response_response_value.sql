select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_response.response_value' else 'SUCCESS' end as Message
from 
(
select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_response_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.f_response DWH on DWH.row_id = S.sys_id 

where ifnull(coalesce(S.answer_integer, case when replace(S.response,'\n','') REGEXP '^[0-9]+$' then replace(S.response,'\n','')  else S.answer_integer end ),'') <> ifnull(DWH.response_value,'')

union all

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_question_final WHERE CDCTYPE<>'D') A 
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_final WHERE CDCTYPE<>'D') B on (A.instance = B.sys_id) 
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') C on (B.metric_type = C.sys_id and C.evaluation_method = 'survey')
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_result_final WHERE CDCTYPE<>'D') D on (D.instance_question = A.sys_id)

left join #DWH_TABLE_SCHEMA.f_response DWH on DWH.row_id = A.sys_id 

where ifnull(round(coalesce(D.actual_value, case when  replace(D.string_value,'\n','') REGEXP '^[0-9]+$' then replace(D.string_value,'\n','')  else D.actual_value end ),0),'') <> ifnull(DWH.response_value,'')
)SQ;