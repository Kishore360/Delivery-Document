SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from tivo_mdsdb.incident_final a
 left JOIN  tivo_mdsdb.task_ci_final b
on  b.task = a.SYS_ID and a.sourceinstance=b.sourceinstance
 left join tivo_mdwdb.d_configuration_item c 
on  b.ci_item=c.row_id 
join tivo_mdwdb.f_incident  d on d.row_id=b.sys_id and d.source_id=b.sourceinstance
 where 
coalesce(c.row_key,case when ci_item is null then 0 else -1 end) <>d.configuration_item_c_key )b;