SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from cardinalhealth_mdsdb.rm_enhancement a
 left  JOIN  cardinalhealth_mdwdb.d_enhancement_rm_c b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 where  a.sys_class_name <>b.task_type )b