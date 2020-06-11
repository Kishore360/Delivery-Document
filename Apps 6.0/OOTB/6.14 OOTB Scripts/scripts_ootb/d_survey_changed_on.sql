select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for changed_on between survey_final & asmt_metric_type_final to d_survey' else 'SUCCESS' end as Message
from 
(
select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_master_final WHERE CDCTYPE<>'D') S
left join #DWH_TABLE_SCHEMA.d_survey DWH
on S.sys_id = DWH.row_id and S.sourceinstance = DWH.source_id
where ifnull(convert_tz(S.sys_updated_on, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'') <> ifnull(DWH.changed_on,'')

union all

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') A
left join #DWH_TABLE_SCHEMA.d_survey DWH
on A.sys_id = DWH.row_id and A.sourceinstance = DWH.source_id
where A.evaluation_method = 'survey' and
ifnull(convert_tz(A.sys_updated_on, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'') <> ifnull(DWH.changed_on,'')
)SQ;
