
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.sc_task_final s
left join asu_mdwdb.f_request_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN asu_mdwdb.d_internal_contact l 
 ON ( concat('INTERNAL_CONTACT~',assigned_to)= l.row_id 
AND s.sourceinstance= l.source_id )
 WHERE COALESCE(l.row_key,CASE WHEN s.assigned_to IS NULL THEN 0 else '-1' end)<> COALESCE(t.assigned_to_key,'')
) temp


