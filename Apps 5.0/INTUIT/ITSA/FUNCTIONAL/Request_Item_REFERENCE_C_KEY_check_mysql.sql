 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.reference_c_key aa,qa.value,c.row_key bb
from
 intuit_mdwdb.f_request_item_variable_c a
 join intuit_mdsdb.sc_item_option_final qa
 on left(a.row_id,32)=qa.sys_id
and a.source_id=qa.sourceinstance
left join intuit_mdsdb.question_final q 
on qa.item_option_new=q.sys_id 
and qa.sourceinstance=q.sourceinstance 
join intuit_mdsdb.sys_choice_final c 
on q.type=c.value and c.element='type' and c.name like 'question'  and  c.label ='Reference' 
left join intuit_mdsdb.question_choice_final qc 
on qa.value=qc.value and qa.item_option_new=qc.question
left join intuit_mdwdb.d_variable_lov_c c
on Case when c.label='Select Box'  then qc.sys_id else null end = c.row_id 
)asd
where aa<>bb )TEMP

