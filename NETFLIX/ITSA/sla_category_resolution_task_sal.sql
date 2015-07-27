SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match:'
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from netflix_mdwdb.d_task_sla a where lower(sla_name) like '%Incident%Closure%' and a.sla_category<>'resolution'
) c
