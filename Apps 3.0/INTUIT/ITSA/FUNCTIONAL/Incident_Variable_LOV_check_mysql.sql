SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM
(select count(1) cnt 
from intuit_mdsdb.question_answer_final b left join intuit_mdwdb.f_incident_variable_c a
 
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
left join intuit_mdwdb.d_variable_lov_c c
on b.value=c.value
and b.question=c.variable_id
left join intuit_workdb.lsm_ls_variable_list aaa on  b.question=aaa.row_id  where  aaa.table_name ='incident'
and aaa.variable_type='Select Box'

and coalesce(c.row_key, case when b.value is null or  b.question  is null then 0 else -1 end ) <>a.reference_c_key )x