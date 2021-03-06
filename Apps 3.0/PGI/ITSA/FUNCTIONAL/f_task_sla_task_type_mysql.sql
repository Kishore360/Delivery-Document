SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from pgi_mdwdb.f_task_sla
where
task_type NOT IN('INCIDENT','U_EXTERNAL_INCIDENT','U_INTERNAL_INCIDENT')  and lower(task_type) like '%incident%')c;