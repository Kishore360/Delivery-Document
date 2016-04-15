SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.requested_for_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.u_hr_case_final SRC 
 LEFT JOIN molinahealth_mdwdb.f_hr_case_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN molinahealth_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',u_opened_for)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
and DATE_FORMAT(coalesce(
convert_tz(SRC.opened_at,'GMT','America/Los_Angeles'),
convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/Los_Angeles')),'%Y-%m-%d %H:%i:%s') 
between LKP.effective_from and LKP.effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_opened_for IS NULL THEN 0 else -1 end)<> (TRGT.requested_for_key)
 
 