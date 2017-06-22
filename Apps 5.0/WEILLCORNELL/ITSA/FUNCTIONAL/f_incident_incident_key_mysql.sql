SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.incident_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
FROM weillcornell_mdsdb.incident_final SRC 
JOIN weillcornell_mdwdb.f_incident TRGT 
ON SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id 
LEFT JOIN weillcornell_mdwdb.d_incident LKP 
ON SRC.sys_id= LKP.row_id AND SRC.sourceinstance= LKP.source_id and LKP.soft_deleted_flag='N'
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_id IS NULL THEN 0 else -1 end)<> (TRGT.incident_key)
AND SRC.sys_id not in (select B.sys_id
FROM
weillcornell_mdsdb.incident_final B
JOIN weillcornell_mdsdb.sys_user_final C
ON C.sys_id = B.caller_id
JOIN weillcornell_mdsdb.cmdb_ci_final D
ON D.sys_id = B.u_business_service
WHERE UPPER(C.user_name) = 'GUEST'
AND UPPER(D.name) = 'ONLINE DIRECTORY' )
 )b
