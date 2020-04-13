SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.key_action_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT  count(1) as CNT
FROM rogers6_mdsdb.u_pm_action_items_final SRC 
LEFT JOIN  rogers6_mdwdb.d_problem_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
where case when SRC.u_key_action=1 then 'Y' else 'N' end<>TRGT.key_action_c_flag
AND SRC.cdctype='X' ) temp; 
