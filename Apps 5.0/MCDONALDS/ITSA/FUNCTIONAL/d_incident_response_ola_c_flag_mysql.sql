SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.response_ola_c_flag' ELSE 'SUCCESS' END as Message 
FROM ( SELECT * FROM mcdonalds_mdsdb.incident_final WHERE CDCTYPE<>'D')  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE (CASE WHEN SRC.u_response_ola = 1 then 'Y' else 'N' END) <> (TRGT.response_ola_c_flag) 
