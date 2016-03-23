

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.u_tech_ops_request_final s
left join tivo_mdwdb.f_request t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join tivo_mdwdb.d_lov l
on concat('CATEGORY_C~TECH_OPS_REQUEST~~~',upper(s.u_category))=l.row_id and s.sourceinstance=l.source_id
WHERE l.row_key <> t.category_src_c_key
) temp