
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.sc_task_final s
left join asu_mdwdb.f_request_task t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN asu_mdwdb.d_calendar_date l 
ON COALESCE(DATE_FORMAT(convert_tz(s.work_end ,'GMT','US/Mountain'),'%Y%m%d'),'UNSPECIFIED')=l.row_id 
WHERE t.work_end_on_c_key <> l.row_key
) temp