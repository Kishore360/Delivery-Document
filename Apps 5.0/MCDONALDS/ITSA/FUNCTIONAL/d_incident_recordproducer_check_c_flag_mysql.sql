SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.recordproducer_check_c_flag' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdsdb.incident_final  SRC 
JOIN mcdonalds_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id and SRC.cdctype<>'D' )  
WHERE (CASE WHEN SRC.u_recordproducer_check = 1 then 'Y' else 'N' END) <> (TRGT.recordproducer_check_c_flag) 
