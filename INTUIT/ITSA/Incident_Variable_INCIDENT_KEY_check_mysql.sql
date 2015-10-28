 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.incident_key,b.value,c.row_key
from intuit_mdwdb.f_incident_variable_c a
inner join intuit_mdsdb.question_answer_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_incident c
on b.table_sys_id=c.row_id
and b.sourceinstance=c.source_id
where  a.incident_key<>c.row_key)A)TEMP