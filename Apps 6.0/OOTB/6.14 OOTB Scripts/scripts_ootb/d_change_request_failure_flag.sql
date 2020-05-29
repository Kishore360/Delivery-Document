
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LM 
 ON (SRC.review_status  =LM.dimension_code  
 AND SRC.sourceinstance = LM.source_id  )
 
 WHERE dimension_class ='REVIEW_STATUS~CHANGE_REQUEST'
 AND CASE WHEN LM.dimension_wh_code = 'FAIL' THEN 'Y' ELSE 'N' END <> TRGT.failure_flag 