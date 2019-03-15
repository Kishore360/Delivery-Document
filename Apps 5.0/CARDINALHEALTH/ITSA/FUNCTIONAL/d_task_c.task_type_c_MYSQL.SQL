SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from cardinalhealth_mdsdb.task_final a
 left  JOIN   cardinalhealth_mdwdb.d_task_c b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
LEFT JOIN cardinalhealth_mdsdb.sys_db_object_final lkp ON lkp.name = a.sys_class_name
 where COALESCE(lkp.label,'UNSPECIFIED') <> b.task_type_c)a;