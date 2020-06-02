SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( CONCAT('STATE','~','CHANGE_REQUEST','~',UPPER(SRC.change_request_status)) = LKP.row_id 
 and LKP.dimension_class='STATE~CHANGE_REQUEST' 
 AND SRC.sourceinstance = LKP.source_id )
WHERE coalesce(CASE WHEN LKP.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END,'') <> coalesce(TRGT.backlog_flag,'') 
