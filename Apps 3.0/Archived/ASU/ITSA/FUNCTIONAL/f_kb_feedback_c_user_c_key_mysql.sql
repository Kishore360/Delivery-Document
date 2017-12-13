SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.author_c_key' ELSE 'SUCCESS' END as Message
 FROM asu_mdsdb.kb_feedback_final SRC 
 LEFT JOIN asu_mdwdb.f_kb_feedback_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN asu_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.user)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.user IS NULL THEN 0 else -1 end)<> (TRGT.user_c_key)