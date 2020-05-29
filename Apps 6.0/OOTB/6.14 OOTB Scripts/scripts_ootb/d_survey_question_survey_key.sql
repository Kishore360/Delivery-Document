 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
 FROM 
(
select TRGT.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.survey_question_new_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_survey_question TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_survey LKP ON (SRC.master = LKP.row_id AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.master IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.survey_key,'')
 
union all

select DWH.row_id
from ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_final WHERE CDCTYPE<>'D') A 
join ( SELECT * FROM #MDS_TABLE_SCHEMA.asmt_metric_type_final WHERE CDCTYPE<>'D') B on (A.metric_type = B.sys_id)
left join #DWH_TABLE_SCHEMA.d_survey_question DWH on A.sys_id = DWH.row_id and A.sourceinstance = DWH.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_survey LKP ON (A.metric_type = LKP.row_id AND A.sourceinstance = LKP.source_id )

where B.evaluation_method = 'survey' and
COALESCE(LKP.row_key,CASE WHEN A.metric_type IS NULL THEN 0 else -1 end) <> ifnull(DWH.survey_key,'')
) SQ;