SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_upc_ean' ELSE 'SUCCESS' END as Message
FROM bhn_mdsdb.incident_final SRC 
LEFT JOIN bhn_mdwdb.d_incident TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE( SRC.u_upc_ean,'')<> COALESCE(TRGT.upc_ean_c,'')
 