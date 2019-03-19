SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from (select sys_id,sourceinstance from cardinalhealth_mdsdb.task_final where  sys_class_name='incident' )a
   JOIN   cardinalhealth_mdwdb.d_task_c b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
LEFT JOIN cardinalhealth_mdsdb.incident_final lkp ON lkp.sys_id = a.sys_id
 where   CASE WHEN  lkp.reopen_count > 0 then 'Y' else 'N' END <> reopened_flag) temp; 