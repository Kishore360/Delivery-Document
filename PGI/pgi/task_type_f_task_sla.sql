SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from pgi_workdb.dwh_f_task_sla
where
task_type <> 'INCIDENT' and lower(task_type) like '%incident%')c;