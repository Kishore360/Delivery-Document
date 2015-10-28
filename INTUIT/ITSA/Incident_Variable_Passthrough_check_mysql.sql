 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from 
intuit_mdsdb.question_final a
join intuit_workdb.lsm_ls_variable_list b on a.sys_id=b.row_id
left join intuit_mdsdb.sys_choice_final t  on t.name='question' and a.type=t.value
left join intuit_mdwdb.d_variable c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id where a.question_text<>c.question_text or 
a.name<>c.name or
a.Reference<>c.Reference or
a.Choice_table<>c.Choice_table or
a.Choice_field<>c.choice_column or 
t.label<>c.variable_type)temp