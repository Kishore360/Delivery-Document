SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match'
ELSE 'Data Matched' END AS Message
FROM (
select  count(1) as cnt
from (
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,b.u_category as category from 
tivo_mdsdb.u_tech_ops_request_final b
left join tivo_mdsdb.sc_category_final c on b.u_category=c.sys_id and b.sourceinstance=c.sourceinstance 
where b.sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union 
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,b.u_completion_category as category from 
tivo_mdsdb.sc_req_item_final b
left join tivo_mdsdb.sc_category_final c on b.u_completion_category=c.sys_id and b.sourceinstance=c.sourceinstance
union 
select b.sys_id as sys_id,b.sourceinstance as sourceinstance,NULL as category from 
tivo_mdsdb.sc_request_final b
)s
left join tivo_mdwdb.f_request t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
join tivo_mdwdb.d_request c on c.row_key=t.request_key
left join tivo_mdwdb.d_lov l
on COALESCE(CONCAT('CATEGORY_C~TECH_OPS_REQUEST~~~',s.category),'UNSPECIFIED')=l.row_id and s.sourceinstance=l.source_id
WHERE coalesce(l.row_key,case when s.category is null then 0 else -1 end) = t.category_src_c_key)temp