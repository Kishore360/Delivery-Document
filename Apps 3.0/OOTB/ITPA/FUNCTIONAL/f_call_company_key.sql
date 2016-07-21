SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_call.company_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.new_call_final SRC 
 
 LEFT JOIN <<tenant>>_mdsdb.sys_user_final SRC2
ON (SRC.caller = SRC2.sys_id
AND  SRC.sourceinstance= SRC2.sourceinstance)

 LEFT JOIN <<tenant>>_mdwdb.f_call TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 LEFT JOIN <<tenant>>_mdwdb.d_internal_organization LKP 
 ON ( CONCAT('SUBSIDIARY~',SRC2.company) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC2.company IS NULL THEN '0' else '-1' end)<> COALESCE(TRGT.company_key,'')
