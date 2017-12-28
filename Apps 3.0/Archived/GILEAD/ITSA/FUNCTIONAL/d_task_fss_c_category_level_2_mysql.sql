SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
select count(1) as cnt
from gilead_mdwdb.d_task_fss_c a
INNER JOIN gilead_mdsdb.u_task_fss_final src ON a.row_id = src.sys_id AND a.source_id = src.sourceinstance
LEFT JOIN gilead_mdsdb.u_sparc_category_choices_final c ON src.u_category_level_2=c.sys_id
where c.u_value<>a.category_level_2
)a; 
