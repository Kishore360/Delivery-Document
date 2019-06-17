

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.incident_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.change_request_final SRC 
LEFT JOIN png_mdwdb.f_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.d_incident LKP ON SRC.u_pg_incident=LKP.row_id AND SRC.sourceinstance=LKP.source_id

WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_incident IS NULL THEN 0 ELSE -1 END)<>TRGT.incident_key
) temp; 


 