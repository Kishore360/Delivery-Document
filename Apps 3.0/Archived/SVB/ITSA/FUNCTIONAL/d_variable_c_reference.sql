 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from 
(select distinct q.sys_id as row_id, 
q.sourceinstance  as source_id,
q.reference as reference
from
svb_mdsdb.question_final q 
left join svb_mdsdb.sys_choice_final c 
on q.type=c.value and c.element='type' and c.name like 'question' 
left join svb_workdb.lsm_ls_variable_list l
on q.name  = l.variable_name and l.enable_flag='Y' and 
q.sys_id =l.row_id 
inner join svb_workdb.lsm_ls_variable_datatype k on 
l.variable_type=k.variable_type) src
join 
svb_mdwdb.d_variable_c c
on src.row_id=c.row_id and src.source_id=c.source_id
where  src.reference<>c.reference
 )c
