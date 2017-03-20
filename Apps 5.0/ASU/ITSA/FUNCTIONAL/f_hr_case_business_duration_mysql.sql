SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.hr_case_final s
left  JOIN asu_mdwdb.f_hr_case t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE  COALESCE(TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.business_duration),0) 
<> COALESCE(t.business_duration,0)  ) temp