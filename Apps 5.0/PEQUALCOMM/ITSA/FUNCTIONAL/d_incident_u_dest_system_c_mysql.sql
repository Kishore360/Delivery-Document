SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_dest_system_c' ELSE 'SUCCESS' END as Message
FROM 
 pequalcomm_mdsdb.incident_final SRC 
 LEFT JOIN pequalcomm_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE CASE WHEN SRC.u_dest_system IS NULL THEN 'UNSPECIFIED' ELSE SRC.u_dest_system END <> TRGT.u_dest_system_c ;
