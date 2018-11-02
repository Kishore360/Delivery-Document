SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt 
from paloalto_mdsdb.task_survey_final a
JOIN  paloalto_mdwdb.f_task_survey b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join paloalto_mdwdb.d_task lkp
on 
a.task= lkp.row_id and a.sourceinstance=lkp.source_id
where lkp.soft_deleted_flag='N' and  lkp.dw_updated_on<b.dw_updated_on and coalesce(lkp.row_key,case when a.task is null then 0 else -1 end)<>b.task_c_key)a
