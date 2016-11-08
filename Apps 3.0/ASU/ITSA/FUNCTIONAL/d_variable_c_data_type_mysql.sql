	
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
from 
asu_mdsdb.question_final q 
left join asu_mdsdb.sys_choice_final c 
on q.type=c.value and c.element='type' and c.name like 'question' 
left join asu_workdb.lsm_ls_variable_list l
on q.name  = l.variable_name and l.enable_flag='Y' and 
q.sys_id =l.row_id 
inner join asu_workdb.lsm_ls_variable_datatype k on 
l.variable_type=k.variable_type	
left join  asu_mdwdb.d_variable_c B on q.sourceinstance=B.source_id 
AND B.ROW_ID=q.SYS_ID
where k.data_type<>B.data_type
	)a

	
