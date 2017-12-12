
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.survey_instance_final s
left join asu_mdwdb.d_survey_instance t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
WHERE convert_tz(s.taken_on,'GMT','US/Mountain') <> t.taken_on ) temp