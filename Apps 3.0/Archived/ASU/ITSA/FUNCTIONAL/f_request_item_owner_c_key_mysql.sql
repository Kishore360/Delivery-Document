
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from asu_mdsdb.sc_req_item_final r
left join asu_mdwdb.f_request_item  t
on r.sys_id=t.row_id and r.sourceinstance=t.source_id
left join asu_mdsdb.sc_cat_item_final s
on s.sys_id=r.cat_item and s.sourceinstance=r.sourceinstance
left join asu_mdwdb.d_internal_contact l
on concat('INTERNAL_CONTACT~',s.u_owner)=l.row_id and s.sourceinstance=l.source_id
WHERE t.owner_c_key <> l.row_key
) temp