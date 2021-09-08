SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.' ELSE 'SUCCESS' END as Message 
FROM mcd_mdsdb.incident_final  SRC 
JOIN mcd_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )  
WHERE COALESCE( convert_tz(SRC.u_vendor_assigned_at , 'GMT','US/Central')) <> TRGT.vendor_assigned_at_c 
