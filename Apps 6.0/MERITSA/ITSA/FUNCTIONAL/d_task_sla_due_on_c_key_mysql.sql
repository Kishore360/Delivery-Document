SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdwdb.d_calendar_date  SRC 
JOIN meritsa_mdwdb.d_task_sla TRGT 
ON SRC.row_id=TRGT.due_on_c_id
WHERE SRC.row_key<>(TRGT.due_on_c_key) 
