SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
FROM 
(
 SELECT Count(1) as CNT 
FROM png_mdsdb.incident_final SRC
LEFT JOIN png_mdwdb.d_incident TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
JOIN png_mdwdb.d_lov LKP ON (concat('INCIDENT_TYPE_C~INCIDENT~~~',upper(u_prob_type))= LKP.row_id AND SRC.sourceinstance= LKP.source_id ) 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_prob_type IS NULL THEN 0 else -1 end)<> (TRGT.incident_type_src_c_key)
 ) temp;
 
 
 