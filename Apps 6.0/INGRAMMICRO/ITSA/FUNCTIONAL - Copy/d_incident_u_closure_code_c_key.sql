SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 
'MDS to DWH data validation failed for d_incident.u_closure_code_c_key' ELSE 'SUCCESS' END as Message
FROM 
( Select Count(1) as CNT
FROM  ingrammicro_mdsdb.incident_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_incident TRGT
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN ingrammicro_mdwdb.d_lov LKP ON
CONCAT('CLOSURE_CODE_C','~','INCIDENT','~',SRC.u_closure_code)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_closure_code iS NULL THEN 0 ELSE -1 END) <> TRGT.u_closure_code_c_key
AND TRGT.soft_deleted_flag='N' ) temp;
