SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
 ,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
 ELSE 'Data Matched' END AS Message 
 FROM
 (select count(1) as cnt
from usf_mdsdb.question_choice_final a join
usf_mdwdb.d_variable_lov_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
where a.value<>b.value or a.question<>b.variable_id or a.text<>b.text)a
;


