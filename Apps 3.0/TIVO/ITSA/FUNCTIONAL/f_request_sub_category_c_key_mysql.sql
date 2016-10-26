SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from (
select b.u_sub_category as subcategory,b.sys_id,sourceinstance from tivo_mdsdb.u_tech_ops_request_final b 
where sys_id not in(select sys_id from tivo_mdsdb.sc_request_final)
union
select b.cat_item as subcategory,b.sys_id,sourceinstance from tivo_mdsdb.sc_req_item_final b
union
select NULL as subcategory ,b.sys_id,sourceinstance 
from tivo_mdsdb.sc_request_final b
)
s
left join tivo_mdwdb.f_request t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join tivo_mdwdb.d_master_item l
on coalesce(s.subcategory,'UNSPECIFIED')=l.row_id and s.sourceinstance=l.source_id
WHERE l.row_key <> t.sub_category_c_key
) temp;
