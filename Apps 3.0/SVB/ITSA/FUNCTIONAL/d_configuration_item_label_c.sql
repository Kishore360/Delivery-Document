 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_configuration_item f
join svb_mdsdb.cmdb_ci_final incf
on f.row_id = incf.sys_id and f.source_id= incf.sourceinstance
LEFT JOIN svb_mdsdb.sys_db_object_final c  
on (f.class = c.name and f.source_id= c.sourceinstance) 
where  c.label<>f.label_c

 )c
