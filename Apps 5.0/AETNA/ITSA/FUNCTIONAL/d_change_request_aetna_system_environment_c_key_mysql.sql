 SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.aetna_system_environment_c_key' ELSE 'SUCCESS' END as Message  
 FROM (select sys_id, sourceinstance, u_aetna_system_environments from aetna_mdsdb.change_request_final where CDCTYPE<>'D') SRC
 LEFT JOIN aetna_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aetna_mdwdb.d_aetna_system_environments_c LKP 
 ON (SRC.u_aetna_system_environments=LKP.row_id
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_aetna_system_environments
 IS NULL THEN 0 else -1 end) 
<> (TRGT.aetna_system_environment_c_key);