SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.type_c' ELSE 'SUCCESS' END as Message
FROM truist_mdsdb.cmdb_ci_outage_final SRC 
LEFT JOIN truist_mdsdb.incident_final inc 
on SRC.task_number=inc.sys_id and SRC.sourceinstance=inc.sourceinstance
LEFT JOIN truist_mdwdb.f_outage TRGT 
ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id )
WHERE SRC.type<>TRGT.type_c; 
