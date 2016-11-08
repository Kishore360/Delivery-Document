SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.u_standard_change_template_final a
JOIN rei_mdwdb.d_standard_change_template_c b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id 
where  a.contact_type<> b.contact_type
)a;