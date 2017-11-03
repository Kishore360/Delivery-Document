SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.investigation_lead_c_key' ELSE 'SUCCESS' END as Message 
FROM rogersdev_mdsdb.problem_final  SRC
JOIN rogersdev_mdwdb.f_problem TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN rogersdev_mdwdb.d_internal_contact LKP
 ON ( COALESCE(CONCAT('INTERNAL_CONTACT~',SRC.u_investigation_lead),'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance = LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_investigation_lead IS NULL THEN 0 else -1 end)<> (TRGT.investigation_lead_c_key) 
