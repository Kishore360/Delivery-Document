SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.project_risk_color_key' ELSE 'SUCCESS' END as Message
 FROM #DWH_TABLE_SCHEMA.f_project_task TRGT 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( LKP.dimension_class='PROJECT~COLOR~RISK'
AND TRGT.risk_color_code =LKP.dimension_code
AND TRGT.source_id= LKP.source_id )
 WHERE LKP.row_key<> COALESCE(TRGT.project_risk_color_key ,'')
 