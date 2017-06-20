SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from svb_mdsdb.incident_final s
left  JOIN svb_mdwdb.f_incident t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
WHERE  COALESCE(s.calendar_stc,0) 
<> COALESCE(t.calendar_stc_c,0)  ) temp
