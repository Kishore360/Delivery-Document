SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.chat_queue_entry_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT
FROM ingrammicro_mdsdb.incident_final SRC 
JOIN ingrammicro_mdwdb.f_incident TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left JOIN ingrammicro_mdwdb.d_chat_queue_entry_c LKP on LKP.row_id=coalesce(SRC.u_chat_queue_entry,'UNSPECIFIED')
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_chat_queue_entry is NULL THEN 0 ELSE -1 END)<>TRGT.chat_queue_entry_c_key ) temp;