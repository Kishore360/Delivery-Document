	 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
from 
usf_mdsdb.question_final q 
left join usf_mdsdb.sys_choice_final c 
on q.type=c.value and c.element='type' and c.name like 'question' 
left join usf_workdb.lsm_ls_variable_list l
on q.name  = l.variable_name and l.enable_flag='Y' and 
q.sys_id =l.row_id 
inner join usf_workdb.lsm_ls_variable_datatype k on 
l.variable_type=k.variable_type	
left join  usf_mdwdb.d_variable_c B on q.sourceinstance=B.source_id 
AND B.ROW_ID=q.SYS_ID
where c.label <>B.variable_Type
	)a
	
