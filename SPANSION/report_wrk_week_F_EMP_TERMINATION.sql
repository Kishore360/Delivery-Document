SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( 
select COUNT(*) as cnt
from spansion_mdsdb.us_spansiongtp_final a inner join spansion_workdb.dwh_f_employee_termination b 
on b.row_id=CONCAT(a.report_workweek,'~',a.employee_id)  collate utf8_unicode_ci 
where a.report_workweek  <> b.report_work_week collate utf8_unicode_ci
)c