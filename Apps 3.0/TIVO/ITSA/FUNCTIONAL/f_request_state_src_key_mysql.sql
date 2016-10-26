
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
from (select sys_id,state as state,sourceinstance,'STATE~TECH_OPS_REQUEST~~~' as join_cond from tivo_mdsdb.u_tech_ops_request_final
where sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union 
select sys_id,state as state,sourceinstance,'STATE~SC_REQ_ITEM~~~' as join_cond from   tivo_mdsdb.sc_req_item_final
union 
select sys_id, request_state as state ,sourceinstance,'REQUEST_STATE~SC_REQUEST~~~' as join_cond from  tivo_mdsdb.sc_request_final
 )
 s
left join   tivo_mdwdb.f_request t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join tivo_mdwdb.d_lov l
on concat(s.join_cond,upper(s.state))=l.row_id and s.sourceinstance=l.source_id
WHERE COALESCE(l.row_key,CASE WHEN s.state IS NULL THEN 0 else -1 end) <> t.state_src_key