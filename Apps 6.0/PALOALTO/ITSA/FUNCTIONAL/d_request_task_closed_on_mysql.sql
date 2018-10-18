
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from paloalto_mdsdb.sc_task_final s
left  JOIN paloalto_mdwdb.d_request_task t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE t.closed_on<> convert_tz(s.closed_at,'GMT','America/Los_Angeles')) temp

