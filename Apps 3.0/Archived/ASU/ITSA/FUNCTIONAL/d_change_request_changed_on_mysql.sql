
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.change_request_final s
left join asu_mdwdb.d_change_request   t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE convert_tz(s.sys_updated_on,'GMT','US/Mountain')<>  t.changed_on) temp



