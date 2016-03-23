
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.u_tech_ops_request_final s
left join tivo_mdwdb.f_request t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN tivo_mdwdb.d_master_item lkp
ON s.u_sub_category=lkp.row_id  and s.sourceinstance=t.source_id
WHERE lkp.row_key <> t.sub_category_c_key
) temp