 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from
(select a.reference_c_key aa,b.value,c.row_key bb
from intuit_mdwdb.f_incident_variable_c a
inner join intuit_mdsdb.question_answer_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
left join intuit_mdwdb.d_variable_lov_c c
on b.value=c.value
and b.question=c.variable_id
join intuit_workdb.lsm_ls_variable_list aaa on  b.question=aaa.row_id and aaa.table_name ='incident'
and aaa.variable_type='Select Box'
)asd
where aa<>bb )temp

