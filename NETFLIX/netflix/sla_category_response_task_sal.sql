SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN concat('Data did not Match: ',cnt)
ELSE 'Data Matched' END AS Message 
FROM (
select count(*) as cnt from netflix_mdwdb.d_task_sla a where (lower(sla_name) like '%ISS Urgent Assignment%' OR lower(sla_name) like '%Normal Assignment%' OR lower(sla_name) like '%Urgent Assignment%') and a.sla_category <> 'response'
) c