SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM wpl_mdsdb.incident_final SRC 
LEFT JOIN wpl_mdwdb.f_incident TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE 
CASE 
 WHEN SRC.u_time_to_repair  is null  THEN NULL   
 WHEN TIMESTAMPDIFF(SECOND,SRC.u_set_to_p1,SRC.u_time_to_repair) < 0 THEN 0  ELSE  TIMESTAMPDIFF(SECOND,SRC.u_set_to_p1,SRC.u_time_to_repair)
 end <> TRGT.set_to_p1_to_repair_duration_c and SRC.cdctype='X'