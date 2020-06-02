
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.emergency_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM firstam_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN firstam_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 JOIN firstam_mdwdb.d_lov_map LM
 on(LM.dimension_code=SRC.`type`
 AND LM.dimension_class='TYPE~CHANGE_REQUEST')
 
 WHERE COALESCE(CASE WHEN  LM.dimension_wh_code = 'Emergency' THEN 'Y' ELSE 'N' END,'') <> COALESCE(TRGT.emergency_flag,'') 
