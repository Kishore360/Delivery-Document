select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for survey_type between survey_final & asmt_metric_type_final to d_survey' else 'SUCCESS' end as Message
from 
(
select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_master_final WHERE CDCTYPE<>'D') S
left join #DWH_TABLE_SCHEMA.d_survey DWH
on S.sys_id = DWH.row_id and S.sourceinstance = DWH.source_id
where ifnull('LEGACY','') <> ifnull(DWH.survey_type,'')

union all

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') A
left join #DWH_TABLE_SCHEMA.d_survey DWH
on A.sys_id = DWH.row_id and A.sourceinstance = DWH.source_id
where A.evaluation_method = 'survey' and
ifnull('ASSESSMENT','') <> ifnull(DWH.survey_type,'')

union all 

select DWH.row_id
from #DWH_TABLE_SCHEMA.d_survey DWH
where DWH.row_key = 0 and 
ifnull('UNSPECIFIED','') <> ifnull(DWH.survey_type,'')

union all 

select DWH.row_id
from #DWH_TABLE_SCHEMA.d_survey DWH
where DWH.row_key = -1 and 
ifnull('UNKNOWN','') <> ifnull(DWH.survey_type,'')
)SQ;