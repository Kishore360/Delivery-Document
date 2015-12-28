SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from wow_mdsdb.task_final s
left join wow_mdsdb.u_category_final uc
on s.u_category = uc.sys_id and s.sourceinstance = uc.sourceinstance
left join wow_mdwdb.f_incident t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
left join wow_mdwdb.d_lov l 
on (concat('category~incident~~~',upper(uc.u_name))= l.row_id 
 and s.sourceinstance= l.source_id )
WHERE COALESCE(l.row_key,CASE WHEN s.subcategory IS NULL THEN 0 else '-1' end)<> COALESCE(t.sub_category_src_key,'')
)
temp