SELECT 
CASE WHEN cnt > 0   THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt > 0  THEN 'MDS to DWH data validation failed for f_incident.caused_by_change_key' ELSE 'SUCCESS' END as Message 
FROM
(
SELECT count(1) cnt 
FROM jhi_mdsdb.incident_final SRC 
LEFT JOIN jhi_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN jhi_mdwdb.d_change_request LKP ON ( SRC.caused_by= LKP.row_id AND SRC.sourceinstance= LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caused_by IS NULL THEN 0 else -1 end)<> (TRGT.caused_by_change_key)
) temp;

