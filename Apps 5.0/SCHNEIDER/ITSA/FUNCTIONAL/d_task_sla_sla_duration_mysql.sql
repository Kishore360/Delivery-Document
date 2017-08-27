SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_task_sla.sla_duration' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.SLM_Measurement SRC
JOIN schneider_mdwdb.d_task_sla TRGT 
on SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE (
CASE WHEN SUM(SRC.targethours,SRC.targetminutes) IS NULL THEN NULL
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SUM(SRC.targethours,SRC.targetminutes)) < 0 THEN NULL
WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SUM(SRC.targethours,SRC.targetminutes)) > 214748364 THEN NULL
ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',SUM(SRC.targethours,SRC.targetminutes)) END ) <> TRGT.sla_duration;