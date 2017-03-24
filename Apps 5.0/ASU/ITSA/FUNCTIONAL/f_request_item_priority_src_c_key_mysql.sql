
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.sc_req_item_final s
left join asu_mdwdb.f_request_item   t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN asu_mdwdb.d_lov l 
 ON ( CONCAT('PRIORITY','~','SC_REQ_ITEM~~~',UPPER(s.priority))= l.src_rowid 
 AND s.sourceinstance= l.source_id )
WHERE l.row_key <> t.priority_src_key
) temp


