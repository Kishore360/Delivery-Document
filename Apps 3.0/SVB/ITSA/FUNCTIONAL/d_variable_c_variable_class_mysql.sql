SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message FROM (

select count(1)as cnt
from 
svb_mdsdb.question_final q 
left join svb_mdsdb.sys_choice_final c 
on q.type=c.value and c.element='type' and c.name like 'question' 
left join svb_workdb.lsm_ls_variable_list l
on q.name  = l.variable_name and l.enable_flag='Y' and 
q.sys_id =l.row_id 
inner join svb_workdb.lsm_ls_variable_datatype k on 
l.variable_type=k.variable_type
join svb_mdwdb.d_variable_c trgt on q.sys_id=trgt.row_id and  q.sourceinstance=trgt.source_id
where q.name <> trgt.name or q.choice_field<>trgt.choice_column or k.data_type <> trgt.data_type or 
c.label <> trgt.variable_type or q.question_text<>trgt.question_text  or 
q.reference<>trgt.reference or q.choice_table<>trgt.choice_table or variable_class<>trgt.variable_class)abc


