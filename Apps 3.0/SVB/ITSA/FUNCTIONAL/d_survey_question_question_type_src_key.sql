 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 	
svb_mdsdb.survey_question_new_final src
join
svb_mdsdb.asmt_metric_final a 
join svb_mdsdb.asmt_metric_type_final b 
on (a.metric_type = b.sys_id)
JOIN  svb_mdwdb.d_survey_question  trgt
on  trgt.ROW_ID = src.SYS_ID and trgt.sourceinstance=src.source_id
where  case when  b.evaluation_method = 'survey' then coalesce(concat('TYPE','~','QUESTION','~','~','~',upper(a.datatype)),'UNSPECIFIED') else 	coalesce(concat('TYPE','~','QUESTION','~','~','~',upper(src.type)),'UNSPECIFIED') end  <>trgt.question_type_src_key
 )c
