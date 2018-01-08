SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.reassignment_count' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.incident_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE SRC.reassignment_count  <> TRGT.reassignment_count_c ;