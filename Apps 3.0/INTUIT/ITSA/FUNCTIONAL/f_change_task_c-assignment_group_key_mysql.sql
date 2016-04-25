SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
LEFT JOIN intuit_mdwdb.d_internal_organization LKP 
 ON COALESCE(CONCAT('GROUP~',a.assignment_group),'UNSPECIFIED') =LKP.row_id 
AND a.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN a.assignment_group IS NULL THEN 0 else '-1' end)
<> COALESCE(c.assignment_group_key,''))g