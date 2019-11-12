SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.ci_autofill_c_key' ELSE 'SUCCESS' END as Message 
FROM wpl_mdsdb.change_request_final  SRC 
JOIN wpl_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )  
LEFT JOIN wpl_mdwdb.d_lov LKP 
ON ( concat( 'CI_CLASS_AUTOFILL_C~INCIDENT~' ,upper( SRC.u_ci_autofill)) = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_ci_autofill IS NULL THEN 0 else -1 end)<> (TRGT.ci_autofill_c_key) 
and SRC.cdctype='X'
