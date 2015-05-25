SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from pgi_workdb.dwh_d_task_sla a
where
a.sla_category<> 'resolution' and lower(sla_name) like '%resolved%')c;
 