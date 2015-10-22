 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
 select a.value,c.value,
a.text,c.text,
a.question,c.variable_id from 
intuit_mdsdb.question_choice_final a
join intuit_workdb.lsm_ls_variable_list b on a.sys_id=b.row_id
left join intuit_mdwdb.d_variable_lov_c c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id where 
a.value<>c.value or 
a.text<>c.text or 
a.question<>c.variable_id)A)TEMP