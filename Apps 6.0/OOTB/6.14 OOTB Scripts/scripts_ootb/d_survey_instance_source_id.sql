select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for taken_on between survey_instance_final to d_survey_instance' else 'SUCCESS' end as Message
from 
(
select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_instance_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.d_survey_instance DWH on DWH.row_id = S.sys_id and S.sourceinstance = DWH.source_id
where ifnull(S.sourceinstance,'') <> ifnull(DWH.source_id,'')

union all 

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_final WHERE CDCTYPE<>'D') A
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') B on (A.metric_type = B.sys_id)

left join #DWH_TABLE_SCHEMA.d_survey_instance DWH on DWH.row_id = A.sys_id and A.sourceinstance = DWH.source_id
where B.evaluation_method = 'survey' and
ifnull(A.sourceinstance,'') <> ifnull(DWH.source_id,'')
) SQ