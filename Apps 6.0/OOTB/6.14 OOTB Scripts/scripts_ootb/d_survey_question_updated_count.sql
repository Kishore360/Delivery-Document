select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for updated_count between survey_question_new_final & asmt_metric_final to d_survey_question' else 'SUCCESS' end as Message
from 
(
select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_question_new_final WHERE CDCTYPE<>'D') S
left join #DWH_TABLE_SCHEMA.d_survey_question DWH on S.sys_id = DWH.row_id and S.sourceinstance = DWH.source_id

where ifnull(S.sys_mod_count,'') <> ifnull(DWH.updated_count,'')

union all

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_final WHERE CDCTYPE<>'D') A 
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') B on (A.metric_type = B.sys_id)
left join #DWH_TABLE_SCHEMA.d_survey_question DWH on A.sys_id = DWH.row_id and A.sourceinstance = DWH.source_id

where B.evaluation_method = 'survey' and
ifnull(A.sys_mod_count,'') <> ifnull(DWH.updated_count,'')
) SQ;