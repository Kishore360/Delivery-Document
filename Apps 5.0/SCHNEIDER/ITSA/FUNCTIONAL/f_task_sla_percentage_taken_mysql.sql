SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.percentage_taken' ELSE 'SUCCESS' END as Message from  
FROM schneider_mdsdb.SLM_Measurement SRC
JOIN schneider_mdwdb.f_task_sla TRGT 
on SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
WHERE 
(
CASE 
WHEN SRC.AVAILABLE < -99999999.99 THEN -99999999.99 
WHEN SRC.AVAILABLE > 99999999.99 THEN 99999999.99
ELSE SRC.AVAILABLE END 
) <> COALESCE(TRGT.percentage_taken,0);