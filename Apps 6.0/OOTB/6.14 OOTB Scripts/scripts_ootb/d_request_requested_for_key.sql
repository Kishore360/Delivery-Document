-- Logic as per ITSM-3970
-- requested_for will no longer be populated to remove the driver model dependency. logic as per ITSM-3970

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.requested_for_key' ELSE 'SUCCESS' END as Message
-- select coalesce(LKP.ROW_KEY,case when SRC.requested_for IS  NULL THEN 0 ELSE -1 end) , COALESCE(TRGT.requested_for_key ,'')
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.requested_for) = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id )	
WHERE coalesce(LKP.ROW_KEY,case when SRC.requested_for IS  NULL THEN 0 ELSE -1 end) <> COALESCE(TRGT.requested_for_key ,'')