 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from mercury_mdsdb.survey_response_final a
JOIN  mercury_mdwdb.f_response b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
Where a.u_answer_integer_text <> b.response_answer_integer_c
)c