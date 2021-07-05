SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.infosys_ola_c_flag' ELSE 'SUCCESS' END as Message 
FROM mcd_mdsdb.incident_final  SRC 
JOIN mcd_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE (CASE WHEN SRC.u_infosys_ola = 1 then 'Y' else 'N' END) <> (TRGT.infosys_ola_c_flag) 
