SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.caller_group_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) AS CNT 
FROM equifax_mdsdb.incident_final SRC 

LEFT JOIN equifax_mdwdb.f_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id

left join equifax_mdwdb.d_internal_organization LKP on CONCAT('GROUP~',SRC.u_caller_group)=LKP.row_id AND SRC.sourceinstance=LKP.source_id

WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_caller_group IS NULL THEN 0 ELSE -1 END)<>TRGT.caller_group_c_key 
) temp;


