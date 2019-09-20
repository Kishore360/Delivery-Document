SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_incident.response_sla_c_flag' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from mcdonalds_mdsdb.incident_final  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE (CASE WHEN SRC.u_response_sla = 1 then 'Y' else 'N' END)<>TRGT.response_sla_c_flag and SRC.CDCTYPE='X') ma
