SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.change_task_final a
JOIN rei_mdwdb.d_change_task_c b
on a.sourceinstance=b.source_id
and a.sys_id = b.row_id
where CONCAT('<a href=\"','https://rei.service-now.com/','change_task.do?sys_id=',a.sys_id,'\" target=\"_blank\">',a.number,'</a>')<>b.source_url)a;