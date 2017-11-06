SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from cardinalhealth_mdsdb.task_final a
 left  JOIN   cardinalhealth_mdwdb.d_task_c b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
LEFT JOIN cardinalhealth_mdsdb.incident_final lkp ON lkp.sys_id = a.sys_id
 where  CASE WHEN a.sys_class_name='incident' THEN IF(lkp.reopen_count > 0,'Y','N') ELSE 'N' END <> reopened_flag) temp; 