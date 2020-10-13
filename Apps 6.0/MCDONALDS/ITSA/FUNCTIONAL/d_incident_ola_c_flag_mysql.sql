SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_incident.ola_c_flag' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from mcdonalds_mdsdb.incident_final  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE (CASE WHEN SRC.u_ola = 1 then 'Y' else 'N' END)<>TRGT.ola_c_flag and SRC.cdctype='X') ma
