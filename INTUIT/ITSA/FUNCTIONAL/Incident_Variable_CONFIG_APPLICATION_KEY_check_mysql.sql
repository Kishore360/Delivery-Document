 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt from(
select a.sys_user_key,b.value,c.name,c.reference,c.row_key
from intuit_mdwdb.f_incident_variable_c a
inner join intuit_mdsdb.question_answer_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
inner join intuit_mdwdb.d_variable c
on b.question=c.row_id
and b.sourceinstance=c.source_id
inner join intuit_mdwdb.d_configuration_application_c d
on b.value=d.row_id
and b.sourceinstance=d.source_id
where c.reference='cmdb_ci_appl' AND a.configuration_application_key<>d.row_key)a)temp