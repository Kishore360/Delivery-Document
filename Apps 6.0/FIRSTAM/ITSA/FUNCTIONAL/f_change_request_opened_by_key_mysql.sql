
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM firstam_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN firstam_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN firstam_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',opened_by) = LKP.row_id 
 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_key,'')
