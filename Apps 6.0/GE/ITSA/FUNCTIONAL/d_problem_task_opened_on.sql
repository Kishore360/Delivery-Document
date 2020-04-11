

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.opened_on' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM ge_mdsdb.problem_task_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ge_mdwdb.d_problem_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE convert_tz(SRC.opened_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>') <> TRGT.opened_on 
