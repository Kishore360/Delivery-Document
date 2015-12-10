

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.change_request_final s
left join asu_mdwdb.f_change_request  t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join asu_mdwdb.d_request_item l
on s.u_document_id=l.row_id and s.sourceinstance=l.source_id
WHERE l.row_key = t.change_document_c_key
) temp
