SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from rambus_mdsdb.task_final a
left join rambus_mdwdb.f_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
LEFT JOIN rambus_mdwdb.d_internal_contact LKP 
 ON   CONCAT('INTERNAL_CONTACT~',a.opened_by) = LKP.row_id 
AND a.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key, CASE WHEN a.opened_by  IS NULL THEN 0 else '-1' end)
<> COALESCE(c.opened_by_key,''))g


