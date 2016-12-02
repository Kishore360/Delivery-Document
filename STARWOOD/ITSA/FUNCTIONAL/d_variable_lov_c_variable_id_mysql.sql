SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
 ,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
 ELSE 'Data Matched' END AS Message 
 FROM
 (select count(1) as cnt
from starwood_mdsdb.question_choice_final a join
starwood_mdwdb.d_variable_lov_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
where a.question<>b.variable_id
)a;

