select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for d_survey_instance.survey_type' else 'SUCCESS' end as Message
from 
(
select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_instance_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.d_survey_instance DWH on DWH.row_id = S.sys_id and S.sourceinstance = DWH.source_id
where ifnull('LEGACY','') <> ifnull(DWH.survey_type,'')

union all 

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_final WHERE CDCTYPE<>'D') A
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') B on (A.metric_type = B.sys_id)

left join #DWH_TABLE_SCHEMA.d_survey_instance DWH on DWH.row_id = A.sys_id and A.sourceinstance = DWH.source_id
where B.evaluation_method = 'survey' and
ifnull('ASSESSMENT','') <> ifnull(DWH.survey_type,'')

union all 

select DWH.row_id
from #DWH_TABLE_SCHEMA.d_survey_instance DWH
where DWH.row_key = 0 and 
ifnull('UNSPECIFIED','') <> ifnull(DWH.survey_type,'')

union all 

select DWH.row_id
from #DWH_TABLE_SCHEMA.d_survey_instance DWH
where DWH.row_key = -1 and 
ifnull('UNKNOWN','') <> ifnull(DWH.survey_type,'')
) SQ