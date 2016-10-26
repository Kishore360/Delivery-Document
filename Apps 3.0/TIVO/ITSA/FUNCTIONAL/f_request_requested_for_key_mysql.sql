SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from (
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,NULL as requested_for  from 
tivo_mdsdb.u_tech_ops_request_final b
where b.sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union 
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,b.u_request_for as requested_for from 
tivo_mdsdb.sc_req_item_final b
left join tivo_mdsdb.sc_category_final c on b.u_completion_category=c.sys_id and b.sourceinstance=c.sourceinstance
union 
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,b.requested_for as requested_for from 
tivo_mdsdb.sc_request_final b
)
s left join tivo_mdwdb.f_request t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join tivo_mdwdb.d_internal_contact l
on COALESCE(CONCAT('INTERNAL_CONTACT~',s.requested_for),'UNSPECIFIED')=l.row_id and s.sourceinstance=l.source_id
WHERE l.row_key <> t.requested_for_key
) temp;