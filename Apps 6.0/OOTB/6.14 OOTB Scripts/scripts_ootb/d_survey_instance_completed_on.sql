 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance_final.completed_on' ELSE 'SUCCESS' END as Message
  from 
(
select TRGT.row_id
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_instance_final WHERE CDCTYPE<>'D') SRC
 left join ( SELECT * FROM #MDS_TABLE_SCHEMA.task_survey_final WHERE CDCTYPE<>'D') sf on (sf.instance  = SRC.sys_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_survey_instance TRGT 
 ON (SRC.sys_id  =TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id)
where COALESCE(CONVERT_TZ(sf.completed_date, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'')  <> COALESCE(TRGT.completed_on,'')

union all 

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_final WHERE CDCTYPE<>'D') A
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') B on (A.metric_type = B.sys_id)

left join #DWH_TABLE_SCHEMA.d_survey_instance DWH on DWH.row_id = A.sys_id and A.sourceinstance = DWH.source_id
where B.evaluation_method = 'survey' and
ifnull(convert_tz(A.sys_updated_on, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'') <> ifnull(DWH.completed_on,'')
) SQ;
