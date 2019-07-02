SELECT 
CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.assignment_group_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT count(1) cnt 
FROM png_mdsdb.incident_final SRC 
JOIN png_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN png_mdwdb.d_internal_organization LKP 
ON ( concat('GROUP~',SRC.assignment_group )= LKP.row_idAND SRC.sourceinstance= LKP.source_id ) and TRGT.pivot_date between effective_from and effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> (TRGT.assignment_group_key)
 AND SRC.cdctype='X'
) temp;
 
