

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.due_on' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as CNT
FROM  ntrust_mdsdb.change_request_final SRC
LEFT JOIN ntrust_mdwdb.d_change_request TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
where
TRGT2.planned_start_date_c<>(CONVERT_TZ(SRC.expected_start,'GMT','US/Central'))
and SRC.cdctype='X') temp;

