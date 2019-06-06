SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.business_stc_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM gilead_mdsdb.incident_final SRC 
LEFT JOIN gilead_mdwdb.f_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id 
WHERE SRC.business_stc<>TRGT.business_stc_c
AND TRGT.soft_deleted_flag='N'
) temp;


