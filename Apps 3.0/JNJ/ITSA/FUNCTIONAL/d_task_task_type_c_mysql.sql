SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from jnj_mdwdb.d_task a11
join jnj_mdsdb.sys_db_object_final  a12 on a11.task_type = a12.name and a11.source_id= a12.sourceinstance
WHERE 
a11.task_type_c <> a12.label
)E;