 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.survey_response_final a
JOIN  cardinalhealth_mdwdb.f_response b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
Where case when LENGTH(u_question_text)>60 then
REPLACE(CONVERT(u_question_text USING ASCII),'?','') end <> b.question_text_c)c


