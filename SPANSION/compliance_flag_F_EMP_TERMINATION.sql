SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( 
select COUNT(*) as cnt
from spansion_mdsdb.us_spansiongtp_final a inner join spansion_workdb.dwh_f_employee_termination b 
on b.row_id=CONCAT(a.report_workweek,'~',a.employee_id)  collate utf8_unicode_ci 
inner join spansion_workdb.dwh_d_request_item e ON e.employee_number = a.employee_id collate utf8_unicode_ci 
where  CASE WHEN DATE_FORMAT(a.last_working_day,'%Y%m%d') >= DATE_FORMAT(e.opened_on,'%Y%m%d') THEN 'Y' ELSE 'N' END  
collate utf8_unicode_ci <> b.compliance_flag   #collate utf8_unicode_ci
)c
