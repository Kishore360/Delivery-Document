SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 
'MDS to DWH data validation failed for d_incident.u_previous_incident_state_c_key' ELSE 'SUCCESS' END as Message
FROM 
( Select count(1) as CNT
FROM  ingrammicro_mdsdb.incident_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_incident TRGT
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left JOIN ingrammicro_mdwdb.d_lov LKP ON
COALESCE(CONCAT('PREVIOUS_INCIDENT_C','~','STATE','~','','',UPPER(SRC.u_previous_incident_state)),
                'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_previous_incident_state iS NULL THEN 0 ELSE -1 END) <> TRGT.u_previous_incident_state_c_key
AND TRGT.soft_deleted_flag='N' ) temp;