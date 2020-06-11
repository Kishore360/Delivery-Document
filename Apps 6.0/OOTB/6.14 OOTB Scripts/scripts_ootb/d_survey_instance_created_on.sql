select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for created_on between survey_instance_final to d_survey_instance' else 'SUCCESS' end as Message
from 
(
select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_instance_final WHERE CDCTYPE<>'D') S
left join #DWH_TABLE_SCHEMA.d_survey_instance DWH on DWH.row_id = S.sys_id and S.sourceinstance = DWH.source_id
where ifnull(convert_tz(S.sys_created_on, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'') <> ifnull(DWH.created_on,'')

union all 

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_final WHERE CDCTYPE<>'D') A
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') B on (A.metric_type = B.sys_id)
left join #DWH_TABLE_SCHEMA.d_survey_instance DWH on DWH.row_id = A.sys_id and A.sourceinstance = DWH.source_id
where B.evaluation_method = 'survey' and
ifnull(convert_tz(A.sys_created_on, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'') <> ifnull(DWH.created_on,'')
) SQ
