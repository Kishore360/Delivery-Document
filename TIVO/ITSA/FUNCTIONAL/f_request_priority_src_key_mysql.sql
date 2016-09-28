
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from (select sys_id,priority as priority,sourceinstance from tivo_mdsdb.u_tech_ops_request_final
union 
select sys_id,priority,sourceinstance from tivo_mdsdb.sc_req_item_final
union 
select sys_id, priority ,sourceinstance from  tivo_mdsdb.sc_request_final
 )
 s
left join  tivo_mdwdb.f_request t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join tivo_mdwdb.d_lov l
on concat('PRIORITY~TASK~~~',upper(s.priority))=l.row_id and s.sourceinstance=l.source_id
WHERE COALESCE(l.row_key,CASE WHEN s.priority IS NULL THEN 0 else -1 end) <> t.priority_src_key
) temp;