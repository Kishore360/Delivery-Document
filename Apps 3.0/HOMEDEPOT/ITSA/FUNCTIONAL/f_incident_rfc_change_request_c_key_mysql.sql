SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Message
 
 FROM homedepot_mdsdb.incident_final SRC
 LEFT JOIN homedepot_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN homedepot_mdwdb.d_change_request dcr
 on (SRC.rfc = dcr.row_id  AND SRC.sourceinstance = dcr.source_id ) 
 WHERE COALESCE(dcr.row_key,CASE WHEN SRC.rfc IS NULL THEN 0 else -1 end)<> TRGT.rfc_change_request_c_key;