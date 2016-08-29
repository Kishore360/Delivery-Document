SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.wing_c' ELSE 'SUCCESS' END as Message
FROM nypres_mdsdb.incident_final SRC 
 LEFT JOIN nypres_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE u_wing<> (TRGT.wing_c)  ;
