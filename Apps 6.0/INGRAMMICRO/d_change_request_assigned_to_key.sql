SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as CNT
FROM ingrammicro_mdsdb.u_change_request_v2_final SRC 
JOIN ingrammicro_mdwdb.f_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left JOIN ingrammicro_mdwdb.d_internal_contact LKP on LKP.row_id=coalesce(concat('INTERNAL_CONTACT','~',SRC.assigned_to),'UNSPECIFIED')
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to is NULL THEN 0 ELSE -1 END)<>TRGT.assigned_to_key) temp;
