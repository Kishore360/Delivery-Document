
 SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.task_final SRC
left join ntrust_mdsdb.incident_final inc on SRC.sys_id=inc.sys_id
left join ntrust_mdsdb.problem_final prb on SRC.sys_id=prb.sys_id
 JOIN ntrust_mdwdb.d_task TRGT2 ON (b.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
where 
COALESCE(CONVERT_TZ(inc.resolved_at,'GMT','America/Los_Angeles'),COALESCE(CONVERT_TZ (prb.resolved_at,
 'GMT','America/Los_Angeles'),CONVERT_TZ (prb.closed_at,'GMT','America/Los_Angeles')))<> TRGT2.resolved_on_c and SRC.cdctype='X') temp;




