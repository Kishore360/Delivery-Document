 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
 ON (SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
  LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON (CONCAT('STATE~CHANGE_REQUEST~',UPPER(SRC.change_request_status)) = LKP.src_rowid 
 AND SRC.sourceinstance = LKP.source_id )
WHERE  (case when LKP.dimension_wh_code = 'CLOSED' THEN  
coalesce(substr(CONVERT_TZ(SRC.closed_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),1,19),
substr(CONVERT_TZ(SRC.Last_Modified_Date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),1,19)) else '' end) <> COALESCE(TRGT.closed_on ,'') 
 
 

