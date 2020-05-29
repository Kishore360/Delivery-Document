SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_problem.linked_incident_flag' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM #MDS_TABLE_SCHEMA.problem_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( SRC.related_incidents )<> (TRGT.linked_incident_count ))temp;
