
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.problem_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_problem LKP 
 ON ( task_number = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
join <<tenant>>_mdwdb.f_outage_task TRGT_TASK
on TRGT.OUTAGE_KEY = TRGT_TASK.OUTAGE_KEY
 WHERE COALESCE(LKP.row_key,CASE when SRC.task_number IS NOT NULL and TRGT_TASK.transaction_type <> 'PROBLEM' then 0 
 WHEN SRC.task_number IS NULL THEN 0
 else '-1' end)<> COALESCE(TRGT.problem_key ,'')
