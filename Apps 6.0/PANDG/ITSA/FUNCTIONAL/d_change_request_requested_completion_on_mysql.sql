SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM pandg_mdsdb.change_request_final a
 join   pandg_mdwdb.d_change_request b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
WHERE convert_tz(a.requested_by_date,'GMT','America/New_York')<> b.requested_completion_on;


