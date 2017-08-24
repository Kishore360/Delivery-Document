SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from molinahealth_mdsdb.task_final a
 join molinahealth_mdwdb.f_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
 JOIN molinahealth_mdwdb.d_internal_contact LKP 
 ON   CONCAT('INTERNAL_CONTACT~',a.opened_by) = LKP.row_id 
AND a.sourceinstance= LKP.source_id AND c.pivot_date BETWEEN LKP.effective_from AND LKP.effective_to
WHERE COALESCE(LKP.row_key, CASE WHEN a.opened_by  IS NULL THEN 0 else '-1' end)
<> c.opened_by_key)g
;