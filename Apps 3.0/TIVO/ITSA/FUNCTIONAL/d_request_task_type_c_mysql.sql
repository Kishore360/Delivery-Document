SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from (
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,'IT-Requests' as task_type  from 
tivo_mdsdb.u_tech_ops_request_final b
where b.sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union 
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,'Request Items' as task_type from 
tivo_mdsdb.sc_req_item_final b
union 
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,'Request' as task_type from 
tivo_mdsdb.sc_request_final b
)
s left join tivo_mdwdb.d_request t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE t.task_type_c <> COALESCE(task_type,'UNSPECIFIED')
) temp;