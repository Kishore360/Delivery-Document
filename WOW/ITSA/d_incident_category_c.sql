
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select c.u_name , b.category_c 
from wow_mdsdb.task_final a
left join wow_mdwdb.d_incident b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
  left join wow_mdsdb.u_category_final c 
on  a.u_category=c.sys_id 
 where c.u_name <> b.category_c )g