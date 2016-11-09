SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(

select count(1) as cnt
from rei_mdsdb.pm_project_final b
join rei_mdwdb.d_project a
on
a.row_id = b.sys_id AND a.source_id=b.sourceinstance
join
rei_mdwdb.d_lov s
 on 'UNSPECIFIED' =s.row_id  -- and b.sourceinstance= s.source_id 
where (s.row_key)<> a.project_status_color_src_key)a;