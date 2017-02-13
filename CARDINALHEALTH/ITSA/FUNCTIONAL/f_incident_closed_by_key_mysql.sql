SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_by_key' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.incident_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.d_lov_map L
 ON (concat('STATE~INCIDENT~~~',upper(SRC.incident_state))=L.src_rowid
 AND SRC.sourceinstance=L.source_id )
 LEFT JOIN cardinalhealth_mdwdb.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.closed_by) = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )	
LEFT JOIN cardinalhealth_mdwdb.d_internal_contact LKP1
 ON (SRC.sys_updated_by = LKP1.user_name 
AND SRC.sourceinstance = LKP1.source_id )	
WHERE 
(case when L.dimension_wh_code='CLOSED' and LKP.ROW_KEY IS NOT NULL THEN LKP.ROW_KEY
when L.dimension_wh_code='CLOSED' and LKP.ROW_KEY IS NULL AND LKP1.ROW_KEY IS NOT NULL THEN LKP1.ROW_KEY  
WHEN L.dimension_wh_code<>'CLOSED'  THEN 0 
ELSE -1 end)
<> COALESCE(TRGT.closed_by_key ,'')