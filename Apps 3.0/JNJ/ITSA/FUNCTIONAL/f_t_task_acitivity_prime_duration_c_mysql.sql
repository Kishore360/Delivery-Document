
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from jnj_mdwdb.f_t_task_acitivty a11
where prime_duration_c <> CASE WHEN a11.created_on >= a12.last_resolved_on THEN 0 ELSE primary_duration;
)E;