
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left  JOIN  intuit_mdwdb.d_calendar_date b
on b.row_id = date_format(convert_tz(a.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d') 
where b.row_key <> c.closed_on_key) g