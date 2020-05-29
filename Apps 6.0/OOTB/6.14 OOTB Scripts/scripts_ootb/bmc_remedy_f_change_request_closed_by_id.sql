SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.closed_by_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L
 ON (SRC.change_request_status=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~CHANGE_REQUEST' )
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.SRC.infrastructure_change_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.last_modified_by) = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )	
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP1
 ON (SRC.last_modified_by = LKP1.user_name 
AND SRC.sourceinstance = LKP1.source_id )	
WHERE 
(case when L.dimension_wh_code='CLOSED' and LKP.ROW_KEY IS NOT NULL THEN LKP.ROW_KEY
when L.dimension_wh_code='CLOSED' and LKP.ROW_KEY IS NULL AND LKP1.ROW_KEY IS NOT NULL THEN LKP1.ROW_KEY  
WHEN (L.dimension_wh_code<>'CLOSED' or L.dimension_wh_code is null)  THEN 0 
ELSE -1 end)
<> COALESCE(TRGT.closed_by_key ,'')