SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.change_task_assignee_count_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM keybank_mdsdb.change_request_final SRC 
LEFT JOIN keybank_mdwdb.d_change_failure TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join
(
select b.row_key,count(distinct a.assigned_to_key) as cnt from keybank_mdwdb.f_change_task a join keybank_mdwdb.d_change_request b
 on a.change_request_key=b.row_key group by 1
) ref on ref.row_key=TRGT.change_request_key
 
WHERE ref.cnt<>TRGT.change_task_assignee_count_c
AND SRC.cdctype='X' ) temp; 
