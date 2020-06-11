SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_instance.survey_key' ELSE 'SUCCESS' END as Message
 from 
(
select TRGT.row_id
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_instance_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_survey_instance TRGT 
 ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_survey LKP 
 ON (SRC.survey = LKP.row_id AND SRC.sourceinstance = LKP.source_id)
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.survey IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.survey_key,'')
 
 union all 

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_assessment_instance_final WHERE CDCTYPE<>'D') A
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') B on (A.metric_type = B.sys_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_survey LKP 
 ON (A.metric_type = LKP.row_id AND A.sourceinstance = LKP.source_id)

left join #DWH_TABLE_SCHEMA.d_survey_instance DWH on DWH.row_id = A.sys_id and A.sourceinstance = DWH.source_id
where B.evaluation_method = 'survey' and
COALESCE(LKP.row_key,CASE WHEN A.metric_type IS NULL THEN 0 else -1 end) <> ifnull(DWH.survey_key,'')
) SQ;
