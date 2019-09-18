SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from mcdonalds_mdsdb.incident_task_final s
left join mcdonalds_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
LEFT JOIN mcdonalds_mdwdb.d_calendar_date LKP 
on LKP.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(s.opened_at,'GMT','US/Central'),'%Y%m%d'),'UNSPECIFIED')
WHERE COALESCE(LKP.row_key,CASE WHEN s.opened_at IS NULL THEN 0 else -1 end) <> t.opened_on_key) temp;