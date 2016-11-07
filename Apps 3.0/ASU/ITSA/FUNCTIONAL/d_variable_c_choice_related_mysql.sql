 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select count(1) as cnt
FROM asu_mdsdb.question_final A
left join  asu_mdwdb.d_variable_c B on A.sourceinstance=B.source_id 
AND B.ROW_ID=SYS_ID
WHERE A.choice_table<>B.choice_table or A.reference<>B.reference or A.name<>B.name 
or A.question_text<>B.question_text )A
 
 
 