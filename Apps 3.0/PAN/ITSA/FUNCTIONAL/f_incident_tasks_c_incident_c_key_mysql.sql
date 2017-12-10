SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.notifind_sent_c_flag' ELSE 'SUCCESS' END as Message 
FROM pan_mdwdb.f_incident_tasks_c a
LEFT OUTER JOIN pan_mdwdb.d_incident x ON a.task_key=x.row_key
WHERE a.incident_c_key <> coalesce(x.row_key, -1)
 

 
 