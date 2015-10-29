SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem_task.priority_escalated_flag' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.problem_task_final SRC
LEFT JOIN <<tenant>>_mdwdb.d_problem_task TRGT
 ON SRC.sys_id =TRGT.row_id    AND SRC.sourceinstance= TRGT.source_id
LEFT JOIN <<tenant>>_mdsdb.sys_audit_final TA 
ON SRC.sys_id =TA.documentkey AND SRC.sourceinstance= TA.sourceinstance
AND  TABLENAME = 'problem_task' AND FIELDNAME = 'priority'
WHERE CASE   WHEN TA.NEWVALUE < TA.OLDVALUE THEN 'Y'
          ELSE 'N'
      END <> COALESCE(TRGT.priority_escalated_flag,'');