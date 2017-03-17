
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.sc_task_final s
left join asu_mdwdb.f_request_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN asu_mdwdb.d_lov l 
 ON ( CONCAT('APPROVAL','~','TASK~~~',UPPER(s.approval))= l.src_rowid 
 AND s.sourceinstance = l.source_id )
WHERE l.row_key <> t.approval_state_src_key
) temp

