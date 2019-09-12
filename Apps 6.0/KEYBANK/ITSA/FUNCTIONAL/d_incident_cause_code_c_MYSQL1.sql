SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 
'MDS to DWH data validation failed for d_incident.cause_code_c' ELSE 'SUCCESS' END as Message

FROM 
(
SELECT Count(1) AS CNT 
FROM keybank_mdsdb.incident_final SRC 
LEFT JOIN keybank_mdwdb.d_incident TRGT ON 
(SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join keybank_mdsdb.u_cause_code_final SRC1 on 
SRC1.sys_id=SRC.u_cause_code
WHERE COALESCE(SRC1.u_code,'UNSPECIFIED')<>TRGT.cause_code_c
 AND SRC.cdctype='X' ) temp; 

