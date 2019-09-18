SELECT 
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for d_incident.' ELSE 'SUCCESS' END as Message 
FROM (
SELECT count(1) as CNT
FROM mcdonalds_mdsdb.incident_final  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE COALESCE( convert_tz(SRC.u_eta ,'GMT','US/Central')) <> TRGT.eta_c)a;
