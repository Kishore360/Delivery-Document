







SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.close_code_src_key' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.change_request_final SRC
LEFT JOIN ntrust_mdwdb.f_change_request TRGT2 ON (b.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
where 

 TIMESTAMPDIFF(SECOND,COALESCE(CONVERT_TZ( SRC.work_start, 'GMT','America/Los_Angeles'),
CONVERT_TZ( SRC.sys_created_on,'GMT','America/Los_Angeles')),CONVERT_TZ( SRC.closed_at,
'GMT','America/Los_Angeles')) end
<> TRGT2.problem_time_to_restore_service_c and SRC.cdctype='X') temp;



