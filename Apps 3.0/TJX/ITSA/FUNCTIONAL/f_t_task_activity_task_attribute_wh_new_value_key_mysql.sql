SELECT CASE WHEN cnt > 0 THEN 'SRCAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH daTRGT validation SRCailed SRCor d_incident.MULTIPLE_CATEGORIZATION_SRCLAG' ELSE 'SUCCESS' END as Message
FROM(
select  
count(1) cnt 
from tjx_mdwdb.f_problem as p 
inner join (select task_key,count(1) as cnt from tjx_mdwdb.f_t_task_activity 
where task_attribute_wh_name = 'priority' and task_wh_type = 'problem'
group by task_key having count(1) < 2) as prim0
on p.problem_key = prim0.task_key

inner join tjx_mdwdb.f_t_task_activity as ft
on ft.task_attribute_wh_name = 'priority' and ft.task_wh_type = 'problem'
and ft.task_key = prim0.task_key
where  p.priority_src_key <> ft.task_attribute_wh_new_value_key)b


