SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'PASSTHROUGH NOT MATCHING ON DATA' ELSE 'SUCCESS' END as Message
 FROM(
select count(1) as cnt 

from starwood_mdwdb.f_incident_variable_c a
inner join starwood_mdsdb.question_answer_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
left join starwood_mdwdb.d_variable_lov_c c
on b.value=c.row_id
and c.row_key<>a.reference_c_key

 )temp
;

