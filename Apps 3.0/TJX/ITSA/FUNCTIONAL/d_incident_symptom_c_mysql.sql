SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM (SELECT COUNT(1) as CNT
FROM tjx_mdsdb.incident_final SRC
LEFT JOIN tjx_mdsdb. u_inc_sym_options_final LKP 
ON  SRC.u_symptom = LKP.sys_id 
AND SRC.sourceinstance= LKP.sourceinstance 
LEFT JOIN tjx_mdwdb.d_incident TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id)
WHERE LKP. u_symptom <> (TRGT.symptom_c))temp;