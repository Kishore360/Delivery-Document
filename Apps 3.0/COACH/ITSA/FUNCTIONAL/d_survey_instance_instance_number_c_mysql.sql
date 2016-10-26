SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from coach_mdsdb.asmt_assessment_instance_final a
 left  JOIN  coach_mdwdb.d_survey_instance  b
on  a.SYS_ID= b.ROW_ID and a.sourceinstance=b.source_id
 where  a.number <> b.instance_number_c  )b
 
 
 