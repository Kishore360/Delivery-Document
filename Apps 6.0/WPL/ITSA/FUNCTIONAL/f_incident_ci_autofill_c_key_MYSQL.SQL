SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_incident.ci_autofill_c_key' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from wpl_mdsdb.incident_final  SRC 
JOIN wpl_mdwdb.f_incident TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
LEFT JOIN wpl_mdwdb.d_lov LKP ON COALESCE(CONCAT('CI_CLASS_AUTOFILL_C~INCIDENT~',UPPER(SRC.u_ci_autofill)),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id  
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_ci_autofill IS NULL THEN 0 else -1 end)<> (TRGT.ci_autofill_c_key) 
and SRC.cdctype='X')ma
