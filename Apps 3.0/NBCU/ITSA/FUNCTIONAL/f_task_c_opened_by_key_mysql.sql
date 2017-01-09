SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from nbcu_mdsdb.task_final a
 join nbcu_mdwdb.f_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
 JOIN nbcu_mdwdb.d_internal_contact LKP 
 ON   CONCAT('INTERNAL_CONTACT~',a.opened_by) = LKP.row_id 
AND a.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key, CASE WHEN a.opened_by  IS NULL THEN 0 else '-1' end)
<> c.opened_by_key)g


